import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core/constants/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/data/extension/size_response.dart';

class ReelScreen extends StatelessWidget {
  const ReelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ///video widget
        Container(
          width: double.infinity,
          height: double.infinity,
          color: CupertinoColors.systemBlue,
          child: const Text("video content"),
        ),

        /// text title
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: size.toHeight(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Following",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      " | ",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "For you",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ))),

        ///info
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ///video info widget
              Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: kDefault,bottom: kDefault / 2),
                    height: size.toHeight(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///text user name
                        Text(
                          "@Snake",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: kDefault / 2,
                        ),

                        ///text detail post
                        Text(
                          "asijdioajsodkjoiasjoidjasoijdoaijsojasoijdoiasjodijsoa",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: kDefault / 2,
                        ),
                        ///song name
                        Row(
                          children: [
                            const Icon(Icons.music_note_outlined,color: Colors.white,),
                            Text(
                              "Snake Rock @asopdkpaskp",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),

              ///social tag widget
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(bottom: kDefault),
                height: size.toHeight(45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///profile post video
                    Stack(
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        Container(
                          width: kCircle + 5,
                          height: kCircle + 5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(kCircle)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kCircle),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://media.glamourmagazine.co.uk/photos/614de6bf3de8ee7a81e65933/1:1/w_1920,h_1920,c_limit/PROFILING_240921_GettyImages-1019899896_SQ.jpg',
                            ),
                          ),
                        ),

                        ///add circle
                        Positioned(
                          bottom: kDefault / 6,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(kDefault / 20),
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    buildSocialItemWidget(context,
                        icon: Icons.favorite, text: "1.3M"),
                    buildSocialItemWidget(context,
                        icon: Icons.comment_sharp, text: "2.3M"),
                    buildSocialItemWidget(context,
                        icon: Icons.share, text: "1.3M"),

                    ///animation rotate
                    TiktokAnimationRotate(
                        widget: ClipRRect(
                      borderRadius: BorderRadius.circular(kCircle),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://haulixdaily.com/wp-content/uploads/2018/08/tumblr_inline_pe4i0bR0o21s24py6_540.png',
                        width: kCircle,
                        height: kCircle,
                        fit: BoxFit.cover,
                      ),
                    )),
                  ],
                ),
              ))
            ],
          ),
        )
      ],
    );
  }

  Column buildSocialItemWidget(BuildContext context,
      {required IconData icon, required String text}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: kCircle,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        )
      ],
    );
  }
}

class TiktokAnimationRotate extends StatefulWidget {
  const TiktokAnimationRotate({super.key, required this.widget});

  final Widget widget;
  @override
  State<TiktokAnimationRotate> createState() => _TiktokAnimationRotateState();
}

class _TiktokAnimationRotateState extends State<TiktokAnimationRotate>
    with SingleTickerProviderStateMixin {
  late AnimationController mController;

  @override
  void initState() {
    mController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));

    mController.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: mController,
      builder: (context, child) => Transform.rotate(
        angle: pi * 2 * mController.value,
        child: widget.widget,
      ),
    );
  }
}
