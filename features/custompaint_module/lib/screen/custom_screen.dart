import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  const CustomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // TweenAnimationBuilder<double>(
          //   tween: Tween(begin: -1.0,end: 160),
          //   duration: const Duration(seconds: 3),
          //   builder: (context, value, child) {
          //     return  CustomPaint(
          //       painter: MyPaint(value),
          //       child: Container(),
          //     );
          //   },
          // ),
          CustomPaint(
            painter: MyNavBar(),
            child: const SizedBox(width: double.maxFinite,height: 56,),
          )
        ],
      ),
    );
  }
}

class MyNavBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width * .5, -100,size.width, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}

