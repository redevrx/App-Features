import 'package:chat_message/data/extension/string_extension.dart';
import 'package:chat_message/data/models/auth/sing_up_data.dart';
import 'package:chat_message/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthProvider with ChangeNotifier {
  final repo = AuthRepository();

  bool _isLogin = false;

  bool get isLogin => _isLogin;

  void checkUserLogin() {
    _isLogin = repo.isLogin();
    notifyListeners();
  }

  ///user session data
  AuthResponse? _authResponse;
  AuthResponse get authResponse => _authResponse ?? AuthResponse();

  void onSignUp({required Function() success, required Function() failure}) async {
    print("object");
    print(_singUpData.email);
    print(_singUpData.password);
    if(!_singUpData.email.validEmail() || singUpData.isNull()){

      return;
    }

    final response = await repo.onSingUpWithEmailPassword(_singUpData);
    print("session :${response.user?.toJson()}");
    if (response.user?.email == null) {
      failure();

      return;
    }
    success();
    _authResponse = response;
    notifyListeners();
  }

  void onCheckScreenAuth({required Function() auth,required Function() unAuth}){
    checkUserLogin();
    if(_isLogin){
      auth();
    }else {
      unAuth();
    }
  }

  ///sing up data
  final _singUpData = SingUpData();
  SingUpData get singUpData => _singUpData;

  void onUserNameChange(String? it){
    if(it != null){
      _singUpData.username = it;
      notifyListeners();
    }
  }

  void onEmailChange(String? it){
    if(it != null){
      _singUpData.email = it;
      notifyListeners();
    }
  }

  void onPasswordChange(String? it){
    if(it != null){
      _singUpData.password = it;
      notifyListeners();
    }
  }

}
