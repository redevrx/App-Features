import 'dart:math';

import 'package:flutter/material.dart';

class TiktokAnimationRotate extends StatefulWidget {
  const TiktokAnimationRotate({super.key, required this.widget});

  final Widget widget;
  @override
  State<TiktokAnimationRotate> createState() => _TiktokAnimationRotateState();
}

class _TiktokAnimationRotateState extends State<TiktokAnimationRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController mController;

  @override
  void initState() {
    mController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    mController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    mController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: mController,
      builder: (context, child) => Transform.rotate(
        angle: pi * 2 * mController.value,
        child: widget.widget,
      ),
    );
  }
}