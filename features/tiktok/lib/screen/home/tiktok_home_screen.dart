import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/component/nav/bottom_navigation.dart';
import 'package:tiktok/provider/nav/nav_provider.dart';
import 'package:tiktok/screen/reel/reel_screen.dart';

class TiktokPage extends StatelessWidget {
  const TiktokPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => NavProvider(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<NavProvider>(
          builder: (context, value, child) => IndexedStack(
            index: value.pageIndex,
            children: const [
              ReelScreen(),
              Text("2"),
              Text("3"),
              Text("4"),
              Text("5"),
            ],
          ),
        ),
        bottomNavigationBar: Consumer<NavProvider>(
          builder: (context, value, child) => TiktokBottomNavigation(size: size, selectIndex: value.pageIndex),
        ),
      ),
    );
  }
}
