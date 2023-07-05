import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  bool isShowLoginCard = false;

  @override
  void initState() {
   _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          ///image background
          SizedBox(
            height: size.height,
            child: Image.network(
              'https://hips.hearstapps.com/hmg-prod/images/rw-imagelibrary2020-hires-401-1675366389.jpg',
              fit: BoxFit.fitHeight,
            ),
          ),
          isShowLoginCard ? AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              final value = _controller.value;
              return Positioned(
                height: lerpDouble(size.height, size.height, value),
                bottom: 8,
                left: 4,
                right: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///icons
                    const SizedBox(height: kToolbarHeight,),
                   GestureDetector(
                     onTap: (){
                       setState(() {
                         isShowLoginCard = false;
                       });
                       _controller.reverse();
                     },
                     child:  ClipRRect(
                       borderRadius: BorderRadius.circular(46.0),
                       child: BackdropFilter(
                         filter: ImageFilter.blur(sigmaY: 10.0,sigmaX: 10.0),
                         child: Container(
                           color: Colors.transparent,
                           padding: const EdgeInsets.all(8.0,),
                           child: const Icon(Icons.arrow_back,color: Colors.white,),
                         ),
                       ),
                     ),
                   ),
                    const Spacer(),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(46.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaY: 10.0,sigmaX: 10.0),
                        child: Container(
                          height: lerpDouble( 0,size.height * .8, value),
                          width: lerpDouble( 0,size.width, value),
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(32.0,),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Welcome black",
                                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white),),
                                SizedBox(height: size.height * .01,),
                                Text("Enter Credentials to continue",
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
                                SizedBox(height: size.height * .06,),
                                ///email
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Your email",
                                      style: TextStyle(color: Colors.white),),
                                    SizedBox(height: size.height * .01,),
                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your email',
                                          hintStyle: TextStyle(color: Colors.white),
                                          enabledBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: size.height * .04,),
                                ///password
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Password",
                                      style: TextStyle(color: Colors.white),),
                                    SizedBox(height: size.height * .01,),
                                    Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color: Colors.grey)
                                        ),
                                        child: SingleChildScrollView(
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                                              enabledBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                            ),
                                          )
                                        )
                                    )
                                  ],
                                ),
                                SizedBox(height: size.height * .05,),
                                ///accept
                              SingleChildScrollView(
                                child:   Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CupertinoSwitch(
                                            value: true,
                                            onChanged: (it){}),
                                        SizedBox(width: size.width * .02,),
                                        const Text("Remember to me",style: TextStyle(color:Colors.white))
                                      ],
                                    ),
                                    const Text("Forgot password",style: TextStyle(color: Colors.white),)
                                  ],
                                ),
                              ),
                                SizedBox(height: size.height * .05,),
                                ///social icon
                                Column(
                                  children: [
                                    const Text("Or signing with",style: TextStyle(color: Colors.white),),
                                    SizedBox(height: size.height * .01,),
                                  SingleChildScrollView(
                                    child:  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        buildSocialButton(iconData: Icons.apple),
                                        buildSocialButton(iconData: Icons.facebook),
                                        buildSocialButton(iconData: Icons.sports_soccer_sharp)
                                      ],
                                    ),
                                  )
                                  ],
                                ),
                                SizedBox(height: size.height * .05,),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: Colors.white.withOpacity(.23),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)
                                        )
                                    ),
                                    onPressed: (){},
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: size.width * .25,vertical: 16.0),
                                      child: const Text("Sign In"),
                                    )),
                                SizedBox(height: size.height * .02,),
                                const SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Dont have an Account?",style: TextStyle(color: Colors.white),),
                                        Text("  Create",style: TextStyle(color: Colors.yellow),)
                                      ],
                                )
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              );
            },
          )
         : buildPreviewCard(size, context)
        ],
      ),
    );
  }

  Container buildSocialButton({required IconData iconData}) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey)
      ),
      child: Icon(iconData,color: Colors.white,),
    );
  }

  Positioned buildPreviewCard(Size size, BuildContext context) {
    return Positioned(
          bottom: 8.0,
          right: 8.0,
          left: 8.0,
          height: size.height *.4,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 700),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(46.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(32.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome to GYM24 mobile app!",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                      ),
                      SizedBox(height: size.height * .03,),
                      Text("SignIn to app you have already have account\ncreate as account to continue",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                      const Spacer(flex: 4),
                      Center(
                        child:  ElevatedButton(
                            onPressed: (){
                              setState(() {
                                isShowLoginCard = true;
                              });
                              _controller.forward();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width *.2,vertical: 20.0),
                              child: const Text("Sign In",textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child:  Center(
                          child: Text("Create as Account",
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                          ),),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        );
  }
}
