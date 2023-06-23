import 'package:chat_message/data/table/base_table.dart';

class MessageTable extends BaseTable {
  @override
  String get tableName => 'Message';

  String get id => 'id';
  String get createdAt => 'created_at';
  String get senderId => 'senderId';
  String get receiverId => 'receiverId';
  String get message => 'message';
  String get type => 'type';
  String get roomId => 'roomId';
}