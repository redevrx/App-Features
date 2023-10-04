import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/provider/auth/auth_provider.dart';
import 'package:tiktok/screen/auth/login_screen.dart';

import '../provider/nav/nav_provider.dart';
import 'home/tiktok_home_screen.dart';

class TiktokApp extends StatelessWidget {
  const TiktokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: const Material(
        child: LoginScreen(),
      ),
    );
  }
}


