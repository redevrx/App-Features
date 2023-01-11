
import 'package:chat_bot/screen/chat_bot.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:custompaint_module/screen/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main ()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChange>(
      create: (context) => ThemeChange(ThemeData.light(useMaterial3: true)),
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
      home: const ChatBotScreen(),
    );
  }
}
