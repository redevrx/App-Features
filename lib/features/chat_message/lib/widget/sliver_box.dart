import 'package:flutter/cupertino.dart';

class SliverBox extends StatelessWidget {
  const SliverBox({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: child);
  }
}