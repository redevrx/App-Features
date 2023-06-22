import 'dart:async';

import 'package:chat_message/data/models/user/UserData.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chat_message/data/table/user/user_table.dart';
import 'package:chat_message/data/table/user/chat/user_chat_table.dart';
import 'package:chat_message/data/models/chat/room/room_data.dart';
import 'package:chat_message/data/table/user/chat/message_table.dart';
import 'package:chat_message/data/models/chat/message/message_data.dart';

mixin IChatRepository {
  Stream<List<UserData>> getUsers();
  Future<UserData> getCurrentUser();
  Future<bool> createChatRoom(UserData userData, UserData currentUser);
  Stream<List<RoomData>> getRooms();
  Future<bool> send(String roomId, String receiverId, String message,
      {String type = "message"});
  Stream<List<MessageData>> getMessages(String roomId);
}

class ChatRepository with IChatRepository {
  final _supabase = Supabase.instance;

  @override
  Stream<List<UserData>> getUsers() {
    final controller = StreamController<List<UserData>>.broadcast();
    final uid = _supabase.client.auth.currentUser?.id;

    if (uid == null) {
      throw Exception("user is not login");
    }

    _supabase.client
        .from(UserTable().tableName)
        .stream(primaryKey: ['id']).listen((it) {
      final mData = it.map((e) => UserData.fromJson(e)).toList();
      mData.removeWhere((element) => element.uid == uid);

      controller
        ..sink
        ..add(mData);
    }, onDone: () {
      controller.close();
    });

    return controller.stream;
  }

  @override
  Future<UserData> getCurrentUser() async {
    final uid = _supabase.client.auth.currentUser?.id;

    if (uid == null) {
      throw Exception("user is not login");
    }

    final response = await _supabase.client
        .from(UserTable().tableName)
        .select()
        .eq("uid", uid);

    return response.map((it) => UserData.fromJson(it)).toList().last;
  }

  @override
  Future<bool> createChatRoom(UserData userData, UserData currentUser) async {
    final mTable = UserChatTable();
    try {
      final roomId = '${DateTime.now().microsecondsSinceEpoch}';

      ///sender
      await _supabase.client.from(mTable.tableName).insert({
        mTable.roomId: roomId,
        mTable.senderId: currentUser.uid,
        mTable.receiverId: userData.uid,
        mTable.receiverImgUrl: currentUser.imageUrl,
        mTable.receiverName: currentUser.username,
        mTable.lastMessage: 'create room by ${currentUser.username}',
        mTable.timeSend: '${DateTime.now()}',
        mTable.type: 'message'
      });

      ///receiver
      await _supabase.client.from(mTable.tableName).insert({
        mTable.roomId: roomId,
        mTable.senderId: userData.uid,
        mTable.receiverId: currentUser.uid,
        mTable.receiverImgUrl: userData.imageUrl,
        mTable.receiverName: userData.username,
        mTable.lastMessage: 'create room by ${currentUser.username}',
        mTable.timeSend: '${DateTime.now()}',
        mTable.type: 'message'
      });

      return Future.value(true);
    } catch (err) {
      return Future.value(false);
    }
  }

  @override
  Stream<List<RoomData>> getRooms() {
    final uid = _supabase.client.auth.currentUser?.id;
    final controller = StreamController<List<RoomData>>.broadcast();

    if (uid == null) {
      throw Exception("user is not login");
    }

    _supabase.client
        .from(UserChatTable().tableName)
        .stream(primaryKey: ['id'])
    ///filter chat room for user
        .eq(UserChatTable().receiverId, uid)
        .order(UserChatTable().timeSend,ascending: false)
        .listen((rooms) {
      final mData = rooms.map((e) => RoomData.fromJson(e)).toList();
      ///mData.removeWhere((element) => element.senderId == uid);

      controller
        ..sink
        ..add(mData);
    }, onDone: () {
      controller.close();
    }, onError: (err) {
      controller
        ..sink
        ..addError(err);
      controller.close();
    });

    return controller.stream;
  }

  @override
  Future<bool> send(String roomId, String receiverId, String message,
      {String type = "message"}) async {
    final mTable = MessageTable();
    try {
      ///current user login id
      final senderId = _supabase.client.auth.currentUser?.id;

      if (senderId == null) {
        throw Exception("user is not login");
      }

      ///save message
      await _supabase.client.from(mTable.tableName).insert({
        mTable.createdAt: '${DateTime.now()}',
        mTable.senderId: senderId,
        mTable.receiverId: receiverId,
        mTable.message: message,
        mTable.type: type,
        mTable.roomId: roomId
      });
      
      ///update last message
      final chatTable = UserChatTable();
      await _supabase.client.from(chatTable.tableName)
      .update({chatTable.lastMessage:message,chatTable.timeSend:'${DateTime.now()}'})
      .match({chatTable.roomId:roomId});

      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Stream<List<MessageData>> getMessages(String roomId) {
    final controller = StreamController<List<MessageData>>.broadcast();

    try {
      _supabase.client
          .from(MessageTable().tableName)
          .stream(primaryKey: ['id'])
          .eq(MessageTable().roomId, roomId)
          .listen((it) {
            final mData = it.map((e) => MessageData.fromJson(e)).toList();

            controller
              ..sink
              ..add(mData);
          }, onDone: () {
            controller.close();
          }, onError: (err) {
            controller
              ..sink
              ..addError(err);
            controller.close();
          });
    } catch (err) {
      controller
        ..sink
        ..addError(err);
      controller.close();
    }

    return controller.stream;
  }
}
