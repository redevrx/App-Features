import 'package:flutter/material.dart';

class SliverSizeBox extends StatelessWidget {
  const SliverSizeBox({super.key, this.width = double.infinity, this.height, required this.child});

  final double width;
  final double? height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}