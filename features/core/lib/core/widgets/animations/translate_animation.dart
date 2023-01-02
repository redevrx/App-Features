import 'package:flutter/cupertino.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({Key? key, required this.child, this.type = 0}) : super(key: key);

  final Widget child;
  final int type;
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeInBack,
      builder: (_, value, child) {
        return Transform.translate(
          offset: type == 0 ? Offset(0, 50 * value) : Offset(50 * value, 0),
          child: child,
        );
      },
      child: child,
    );
  }
}
