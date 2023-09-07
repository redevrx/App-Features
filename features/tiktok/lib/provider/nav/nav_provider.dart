import 'package:flutter/cupertino.dart';

class NavProvider extends ChangeNotifier {

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  void onChangePage(int index){
    _pageIndex = index;
    notifyListeners();
  }
}