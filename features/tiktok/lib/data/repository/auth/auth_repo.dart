import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tiktok/data/tables/user_table.dart';

class AuthRepo {
  final _mClient = Supabase.instance.client;

  Future<AuthResponse?> register() async {
    /**
     * mock login with email pass
     */
    AuthResponse? response;

    try {
      response = await _mClient.auth
          .signUp(email: "fagik53004@finghy.com", password: "123456");
    } catch (err) {
      if (err is AuthException) {
        if (err.message == "Email rate limit exceeded") {
          print("login");

          ///has email give login
          ///mock login with email password
          response = await _mClient.auth.signInWithPassword(
              email: "fagik53004@finghy.com", password: "123456");
        }
      }
    }
    return response;
  }

  void saveInfo() async {
    /**
     * mock user info
     */
    final table = UserTable();

    await _mClient.from(table.table).insert({
      table.name: "mSnake",
      table.profileUrl:
          "https://easydrawingguides.com/wp-content/uploads/2022/08/male-face-from-the-side-profile-11.png"
    });
  }
}
