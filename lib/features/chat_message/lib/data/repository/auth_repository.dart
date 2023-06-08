import 'package:chat_message/data/models/auth/sing_up_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

mixin IAuthRepository {
  Future<AuthResponse> onSingUpWithEmailPassword(SingUpData request);
  Future<AuthResponse> onSingUpWithApple();
  bool isLogin();
  Future<AuthResponse> onSingIn(SingUpData request);
}

class AuthRepository with IAuthRepository {
  final supabase = Supabase.instance;

  @override
  Future<AuthResponse> onSingUpWithEmailPassword(SingUpData request) {
    return supabase.client.auth
        .signUp(email: request.email, password: request.email);
  }

  @override
  Future<AuthResponse> onSingUpWithApple() {
    throw UnimplementedError();
  }

  @override
  bool isLogin() => supabase.client.auth.currentUser != null;

  @override
  Future<AuthResponse> onSingIn(SingUpData request) {
    return supabase.client.auth
        .signInWithPassword(email: request.email, password: request.email);
  }
}
