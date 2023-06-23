import 'package:chat_message/provider/auth/auth_provider.dart';
import 'package:chat_message/screen/auth/login_screen.dart';
import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_message/screen/home/home_screen.dart';

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        )
      ],
      child: const ChatSplashScreen(),
    );
  }
}

class ChatSplashScreen extends StatefulWidget {
  const ChatSplashScreen({
    super.key,
  });

  @override
  State<ChatSplashScreen> createState() => _ChatSplashScreenState();
}

class _ChatSplashScreenState extends State<ChatSplashScreen> {
  toLoginScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ));
  }

  void checkAuthNavigation() {
    Provider.of<AuthProvider>(context, listen: false).onCheckScreenAuth(
        auth: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
        }, unAuth: () => toLoginScreen(context));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: size.height * .08,
          ),
          buildImageBackground(),
          /**
           * title text
           */
          SizedBox(
            height: size.height * .06,
          ),
          buildTitleText(context),
          SizedBox(
            height: size.height * .06,
          ),
          buildBottomCard(context, size)
        ],
      ),
    );
  }

  Flexible buildBottomCard(BuildContext context, Size size) {
    return Flexible(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(kDefault * 1.5),
              topRight: Radius.circular(kDefault * 1.5))),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            "Click Next to other screen",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefault, vertical: kDefault * 2),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * .4,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kDefault))),
                    child: Text(
                      "Skip",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .4,
                  child: ElevatedButton(
                    onPressed: () => checkAuthNavigation(),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kDefault))),
                    child: Text(
                      "Next",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Padding buildTitleText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefault),
      child: Text(
        "Real-time Chat Tutorial with Supabase",
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Stack buildImageBackground() {
    return Stack(
      children: [
        Image.asset(
          'assets/chat/images/chat_image.jpg',
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
