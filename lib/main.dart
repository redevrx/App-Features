import 'package:core/core/constants/colors.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/screen/meeting_room_screen.dart';
import 'package:provider/provider.dart';

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
      home: MeetingRoomScreen(),
    );
  }
}
