import 'package:flutter/material.dart';
import 'package:tiktok/data/extension/size_response.dart';

class TiktokHomeScreen extends StatelessWidget {
  const TiktokHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(),
      bottomNavigationBar: Container(
        height: size.toHeight(8),
        width: double.infinity,
        color: Colors.black,
      ),
    );
  }
}
