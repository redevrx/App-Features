import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:chat_message/data/repository/chat_repository.dart';
import 'package:chat_message/data/models/user/UserData.dart';
import 'package:chat_message/data/models/chat/room/room_data.dart';

class ChatProvider extends ChangeNotifier {
  final _repo = ChatRepository();

  Stream<List<UserData>>? _userStream;
  Stream<List<UserData>>? get userStream => _userStream;

  void getUsers() {
    _userStream = _repo.getUsers();
    notifyListeners();
  }

  UserData? _userData;
  UserData get userData => _userData ?? UserData();

  void currentUser() async {
    _userData = await _repo.getCurrentUser();
    notifyListeners();
  }

  void createChatRoom(
      {required UserData userData,
      required Function() success,
      required Function() error}) async {
    if(_userData == null){
      debugPrint("create room error user is not login");
    }

    final response = await _repo.createChatRoom(userData, _userData!);

    if(response){
      success();
      return;
    }
    error();
  }

  Stream<List<RoomData>>? _rooms;
  Stream<List<RoomData>>? get rooms => _rooms;

  void getRooms(){
    _rooms = _repo.getRooms();
    notifyListeners();
  }
}
