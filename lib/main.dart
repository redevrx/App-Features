import 'package:animated_navbar/screen/animated_navbar_screen.dart';
import 'package:comic/screens/shopui_screen.dart';
import 'package:core/core/constants/colors.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:dream_home/screen/dream_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:golive/screen/go_live_screen.dart';
import 'package:login_ui/screen/login_screen.dart';
import 'package:meeting_room/screen/meeting_room_screen.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/screen/task_screen.dart';
import 'package:tutorial/screen/week1/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: '',
  //   anonKey: ''
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChange(ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: bgColor,
          primarySwatch: Colors.blue,
          textTheme:
          const TextTheme(bodyMedium: TextStyle(color: Colors.black54)),
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
    return  const MaterialApp(
      home: HomeScreen(),
    );
  }
}




