
import 'package:chat_bot/screen/chat_bot.dart';
import 'package:comic/screens/home/home_screen.dart';
import 'package:core/core/constants/colors.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:custompaint_module/screen/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:comic/screens/shopui_screen.dart';

void main ()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChange>(
      create: (context) => ThemeChange(ThemeData(
          useMaterial3: true,
      scaffoldBackgroundColor: bgColor,
      primarySwatch: Colors.blue,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: Colors.black54)
      ),
      fontFamily: "Gordita")),
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
      home: const ShopUIScreen(),
    );
  }
}
