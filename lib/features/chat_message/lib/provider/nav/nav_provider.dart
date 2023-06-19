import 'package:flutter/cupertino.dart';

class NavProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void tabChange(int index){
    _index = index;
    notifyListeners();
  }
}