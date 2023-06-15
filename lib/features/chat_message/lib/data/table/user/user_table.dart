import 'package:chat_message/data/table/base_table.dart';

class UserTable extends BaseTable {
  @override
  String get tableName => "User";

  String get idColumn => "id";
  String get userNameColumn => "username";
  String get emailColumn => "email";
  String get uidColumn => "uid";
  String get imgUrlColumn => "img_url";

}