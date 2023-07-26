import 'dart:math';
import 'dart:ui';

import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';

class VideoLiveScreen extends StatelessWidget {
  const VideoLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.network("https://www.sideqik.com/wp-content/uploads/2021/12/professional-smiling-esport-gamer-girl-live-stream-2021-08-28-01-21-32-utc-scaled.jpg",
          fit: BoxFit.fitHeight,
            height: size.height,),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kToolbarHeight),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png"),
                  ),
                  const SizedBox(width: kDefault / 2,),
                  /**
                   * title name
                   * following
                   */
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Naked Snake",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold),),
                      Text("10.2k Follow",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),)
                    ],
                  ),
                  /**
                   * follow button
                   */
                  const SizedBox(width: kDefault,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kDefault / 1.6)
                      )
                    ),
                      onPressed: (){},
                      child: const Text("Follow")),
                  const SizedBox(width: kDefault,),
                  /**
                   * people look live widget
                   */
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefault),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: kDefault / 3,vertical: kDefault / 2),
                        child: Row(
                          children: [
                            const Icon(Icons.visibility_outlined),
                            const Text("12.3K",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: kDefault / 2),
                              padding: const EdgeInsets.symmetric(horizontal: kDefault / 2,vertical: kDefault / 6),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(kDefault / 2)
                              ),
                              child: const Text("Live",style: TextStyle(color: Colors.white)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          /**
           * bottom message box
           */
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: kDefault),
              child: SizedBox(
                height: 60.0,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(kDefault/2),
                      topLeft: Radius.circular(kDefault / 2)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefault),
                    child: Row(
                      children: [
                        /**
                         * input box
                         */
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 3),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.45),
                                borderRadius: BorderRadius.circular(kDefault)
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Comment?",
                                          hintStyle: TextStyle(color: Colors.white),
                                          disabledBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none
                                      ),
                                    )),
                                SizedBox(
                                  height: kHeight - 5,
                                  child: FloatingActionButton(
                                    onPressed: (){},
                                    backgroundColor: Colors.pinkAccent,
                                    child: Transform.rotate(
                                      angle: -pi / 3.8 ,
                                      child: const Icon(Icons.send),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: kDefault / 2),
                          padding: const EdgeInsets.all(kDefault),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.45),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.share_outlined),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: kDefault / 2),
                          padding: const EdgeInsets.all(kDefault),
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.45),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.favorite,color: Colors.pink,),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
           Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * .1,right: kDefault,left: kDefault),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommentCard(comment: "Hello",),
                  CommentCard(comment: "What Game?",),
                  CommentCard(comment: "What your name?",),
                  CommentCard(comment: "Love",)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key, required this.comment,
  });

  final String comment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(kDefault / 2),
      padding: const EdgeInsets.all(kDefault / 2),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.12),
        borderRadius: BorderRadius.circular(kDefault)
      ),
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png"),
          ),
          const SizedBox(width: kDefault / 2,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Naked Snake",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
              Text(comment,style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white,),)
            ],
          )
        ],
      ),
    );
  }
}
