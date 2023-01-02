import 'package:comic/screens/home/home_screen.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main ()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChange>(
      create: (context) => ThemeChange(ThemeData.dark(useMaterial3: true)),
      child: const ThemeWrapaper(),
    );
  }
}

class ThemeWrapaper extends StatelessWidget {
  const ThemeWrapaper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugInvertOversizedImages = true;
    return MaterialApp(
      theme: Provider.of<ThemeChange>(context).getTheme(),
      home: const HomeScreen(),
    );
  }
}
