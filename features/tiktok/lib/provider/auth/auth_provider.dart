import 'package:flutter/material.dart';
import 'package:tiktok/data/repository/auth/auth_repo.dart';

class AuthProvider extends ChangeNotifier {
  final _mRepo = AuthRepo();

  bool _isRegisterSuccess = false;
  bool get isRegisterSuccess => _isRegisterSuccess;

  void signUp(void Function() success,void Function() error) async {
    final response = await _mRepo.register();

    _isRegisterSuccess = response?.user != null;

    if(_isRegisterSuccess){
      _mRepo.saveInfo();
      success();
    }

    if(!_isRegisterSuccess){
     error();
    }

    success();

    notifyListeners();
  }
}
