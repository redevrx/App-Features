import 'package:chat_message/data/table/base_table.dart';

class UserChatTable extends BaseTable {
  @override
  String get tableName => 'UserChat';

  String get idColumn => 'id';
  String get createAt => 'created_at';
  String get roomId => 'roomId';
  String get senderId => 'senderId';
  String get receiverId => 'receiverId';
  String get receiverImgUrl => 'receiverImgUrl';
  String get receiverName => 'receiverName';
  String get lastMessage => 'lastMessage';
  String get type => 'type';
  String get timeSend => 'timeSend';

}