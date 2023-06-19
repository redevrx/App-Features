import 'package:app_feature/features/chat_message/lib/screen/auth/login_screen.dart';
import 'package:app_feature/features/chat_message/lib/screen/auth/register_screen.dart';
import 'package:app_feature/features/chat_message/lib/screen/home/home_screen.dart';
import 'package:app_feature/features/chat_message/lib/screen/splash/ChatSplashScreen.dart';
import 'package:core/core/constants/colors.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:app_feature/features/chat_message/lib/provider/auth/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://bhgsevlzkbiboersdors.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJoZ3Nldmx6a2JpYm9lcnNkb3JzIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODYyMTI4MTIsImV4cCI6MjAwMTc4ODgxMn0.0RYHwTSCk2sdqKCI3flUzd92W65cDpQZDVQSIgnsuGM'
  );
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
      home: ChatApp(),
    );
  }
}
