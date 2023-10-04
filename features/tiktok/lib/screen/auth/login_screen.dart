import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/provider/auth/auth_provider.dart';
import 'package:tiktok/screen/home/tiktok_home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          buildImageBackground(),
          buildContainerGradient(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(
                  flex: 8,
                ),
                buildTextLoginTitle(context),

                ///button
                buildButtonLoginWithPhone(context),
                buildLoginWithTiktok(context),
                buildLoginWithApple(context),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildLoginWithApple(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: kDefault * 2, vertical: kDefault),
      padding: const EdgeInsets.all(kDefault),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefault),
          gradient: const LinearGradient(
              colors: [Colors.pink, Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefault),
            child: Icon(Icons.apple),
          ),
          Text(
            'Continue with Apple',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Container buildLoginWithTiktok(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: kDefault * 2, vertical: kDefault),
      padding: const EdgeInsets.all(kDefault),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kDefault),
          gradient: const LinearGradient(
              colors: [Colors.pink, Colors.indigoAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefault),
            child: Icon(Icons.tiktok),
          ),
          Text(
            'Continue with Tiktok',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  GestureDetector buildButtonLoginWithPhone(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<AuthProvider>(context, listen: false).signUp(() {
          ///login success
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const TiktokPage(),
          ));
        }, () {
          ///error
          const snackBar = SnackBar(
            content: Text('Register Error'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
            horizontal: kDefault * 2, vertical: kDefault),
        padding: const EdgeInsets.all(kDefault),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefault),
            gradient: const LinearGradient(
                colors: [Colors.pink, Colors.indigoAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Text(
          'Continue with Phone Number',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Text buildTextLoginTitle(BuildContext context) {
    return Text(
      "Record you\nmach with then",
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }

  Container buildContainerGradient() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.transparent,
        Colors.grey.withOpacity(.23),
        Colors.black.withOpacity(.4)
      ], begin: Alignment.center, end: Alignment.bottomLeft)),
    );
  }

  Image buildImageBackground() {
    return Image.network(
      'https://images.ctfassets.net/az3stxsro5h5/3zM04TeFwoDx6bT9WN8uLT/fe7e198deaa6165b84c3e5554d704827/Oct27-Instagram_Reels_Ideas-02.png?w=920&h=800&q=50&fm=png',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
