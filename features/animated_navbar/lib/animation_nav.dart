import 'dart:async';
import 'dart:ui';
import 'package:animated_navbar/nav_controller.dart';
import 'package:flutter/material.dart';

class AnimationNav extends StatefulWidget {
  const AnimationNav(
      {super.key,
      required this.maxHeight,
      this.minHeight = 60.0,
      required this.child,
      required this.menuWidget,
      required this.expendedWidget,
      this.bottom = 40,
       this.color = Colors.indigoAccent,
        this.radius = 20.0, required this.navController});

  final double maxHeight;
  final double minHeight;
  final Column child;
  final Widget menuWidget;
  final Widget expendedWidget;
  final double bottom;
  final Color color;
  final double radius;
  final NavController navController;

  @override
  State<AnimationNav> createState() => _AnimationNavState();
}

class _AnimationNavState extends State<AnimationNav>
    with SingleTickerProviderStateMixin {

  ///animation controller
  late AnimationController _controller;

  ///current height for nav
  double _currentHeight = 0.0;

  ///Subscription for current height change
  StreamSubscription<bool>? _streamSubscription;

  @override
  void initState() {
    _currentHeight = widget.minHeight;
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 700));
    widget.navController.setAnimationController(_controller);

    ///update current height
    _streamSubscription = widget.navController.updateHeight.listen((allow) {
      _currentHeight = widget.maxHeight;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    widget.navController.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.child,
        StreamBuilder(
          initialData: false,
          stream: widget.navController.isExpended,
          builder: (context, expended) {
            return GestureDetector(
              onVerticalDragUpdate: (details) {
                final newHeight = _currentHeight - details.delta.dy;
                _controller.value = _currentHeight / widget.maxHeight;
                _currentHeight =
                    newHeight.clamp(widget.minHeight, widget.maxHeight);
              },
              onVerticalDragEnd: (details) {
                if (_currentHeight < widget.maxHeight / 2) {
                  _controller.reverse();
                  widget.navController.isExpendedChange(false);
                } else {
                  widget.navController.isExpendedChange(true);
                  _controller.forward(from: _currentHeight / widget.maxHeight);
                  _currentHeight = widget.maxHeight;
                }
              },
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  final value = const ElasticInOutCurve(.7)
                      .transformInternal(_controller.value);
                  return Stack(
                    children: [
                      Positioned(
                        height:
                            lerpDouble(widget.minHeight, _currentHeight, value),
                        width: lerpDouble(size.width * .5, size.width, value),
                        left: lerpDouble(
                            size.width / 2 - size.width * .5 / 2, 0, value),
                        bottom: lerpDouble(40.0, 0.0, value),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                              color: widget.color,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(widget.radius),
                                  bottom: Radius.circular(
                                      (lerpDouble(widget.radius, 0.0, value))
                                          as double))),
                          child: expended.data == true
                              ? Opacity(
                                  opacity: _controller.value,
                                  child: widget.expendedWidget,
                                )
                              : widget.menuWidget
                              // : GestureDetector(
                              //     onTap: () async {
                              //       widget.navController.isExpendedRevert();
                              //       // _isExpended = !_isExpended;
                              //       _currentHeight = widget.maxHeight;
                              //       _controller.forward(from: 0.0);
                              //     },
                              //     child: widget.menuWidget,
                              //   ),
                        ),
                      )
                    ],
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
