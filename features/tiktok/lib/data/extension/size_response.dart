import 'package:flutter/material.dart';

extension SizeResponse on Size {
  double toHeight(int percent) {
    return height * (percent / 100);
  }

  double toWidth(int percent) {
    return width * (percent / 100);
  }
}
