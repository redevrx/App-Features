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
    if(!_singUpData.email.validEmail() || singUpData.isNull()){

      return;
    }

    final response = await repo.onSingUpWithEmailPassword(_singUpData);
    if (response.user?.email == null) {
      failure();

      return;
    }
    ///first login after create account
    final mResponse = await repo.onSingIn(_singUpData);

    ///save user info data
    repo.onSaveUserInfo(response.user!, username: _singUpData.username);
    _authResponse = mResponse;
    _singUpData = SingUpData();
    notifyListeners();

    success();
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
  SingUpData _singUpData = SingUpData();
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
      print("password change $it");
      _singUpData.password = it;
      notifyListeners();
    }
  }

  void onSignIn({required Function() success,required Function() failure}) async {
    if(_singUpData.password == "" || _singUpData.email == ""){
      print("password null ${_singUpData.password} :${_singUpData.email}");
      return;
    }

    print("login");
    final response = await repo.onSingIn(_singUpData);
    if(response.user == null){
      failure();

      return;
    }

    _authResponse = response;
    notifyListeners();
    success();
  }

}
