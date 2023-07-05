import 'dart:async';

import 'package:flutter/animation.dart';

class NavController {
  ///keep current state for isExpended
  bool _expended = true;

  ///expended stream controller
  final _isExpended = StreamController<bool>();
  
  Stream<bool> get isExpended => _isExpended.stream;
  
  void isExpendedChange(bool it){
    _expended = it;
    _isExpended..sink..add(it);
  }
  
  void isExpendedRevert() {
    _isExpended..sink..add(!_expended);
  }

  late AnimationController controller;

  setAnimationController(AnimationController controller){
    this.controller = controller;
  }


  final _updateHeightController = StreamController<bool>();

  Stream<bool> get updateHeight => _updateHeightController.stream;

  void updateMaxHeight(){
    _updateHeightController..sink..add(true);
  }

  void forward(){
    controller.forward(from: 0.0);
    isExpendedRevert();
    updateMaxHeight();
  }

  void reverse(){
    controller.reverse();
  }

  
  void dispose(){
    _isExpended.close();
    controller.dispose();
    _updateHeightController.close();
  }
}