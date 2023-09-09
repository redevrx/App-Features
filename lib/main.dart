import 'package:core/core/constants/colors.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:encrypt/encrypt.dart' as et;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial/screen/week1/home_screen.dart';
import 'package:tiktok/screen/home/tiktok_home_screen.dart';
import 'package:tutorial/screen/work_shop2/work_shop2.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Supabase.initialize(
  //   url: '',
  //   anonKey: ''
  // );
  runApp(const MyApp());
}

void testCode() {
  const token = "iajsodijaosijdoisajo.iassdsdsdsjd.sdsasdasds";
  final key = et.Key.fromUtf8("023749032${token.split(".")[1]}");
  final encrypter = et.Encrypter(et.AES(key, mode: et.AESMode.cfb64));
  final encrypted = encrypter.encrypt("data");
  print(encrypted.base64);


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
      home: WorkShop2(),
    );
  }
}




