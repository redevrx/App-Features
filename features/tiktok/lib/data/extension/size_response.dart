import 'package:flutter/material.dart';

extension SizeResponse on Size {
  double toHeight(int percent){
    return this.height * (percent / 100);
  }
}