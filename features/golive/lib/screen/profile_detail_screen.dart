import 'dart:ui';

import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';

class ProfileDetailScreen extends StatelessWidget {
  const ProfileDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Stack(
                  children: [
                   Container(
                     height:size.height * .38,
                     alignment: Alignment.topCenter,
                     child: Image.network('https://img.freepik.com/free-vector/gradient-geometric-shapes-dark-background-design_23-2148433740.jpg'),
                   ),
                    Positioned(
                      top: kToolbarHeight - 4,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: kDefault),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           GestureDetector(
                             onTap: (){
                               Navigator.pop(context);
                             },
                             child:  Container(
                               padding:  const EdgeInsets.all(kDefault / 2),
                               decoration: BoxDecoration(
                                   color: Colors.grey.withOpacity(.6),
                                   shape: BoxShape.circle
                               ),
                               child: const Icon(Icons.arrow_back,color: Colors.white,size: kDefault * 2,),
                             ),
                           ),
                            Container(
                              padding:  const EdgeInsets.all(kDefault / 2),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(.6),
                                  shape: BoxShape.circle
                              ),
                              child: const Icon(Icons.more_horiz_rounded,color: Colors.white,size: kDefault * 2,),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: kDefault,
                      bottom: size.height * .02,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(kCircle),
                          child: Image.network("https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png",
                          fit: BoxFit.cover,
                            width: kHeight * 2,
                            height: kHeight* 2,
                          ),
                        )
                      )
                    ),
                    Positioned(
                      bottom: kDefault,
                      right: kDefault,
                      left: size.width * .3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Snake Gamer",
                            style: Theme.of(context)
                                .textTheme.titleLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          Text("Look new video",
                            style: Theme.of(context)
                                .textTheme.titleSmall?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      )
                    ),
                    Positioned(
                        bottom: kDefault - 6,
                        right: size.width * .1,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.indigoAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(kDefault / 2)
                            )
                          ),
                          onPressed: (){},
                          child: const Text("Follow"),
                        )
                    )
                  ],
                ),
                const SizedBox(height: kDefault,),
                Text("The live streaming of video games is an activity where people broadcast themselves playing games to a live audience online. The practice became popular",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: kDefault * 2,),
                /**
                 * social status
                 */
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text("12.4K",
                            style: Theme.of(context)
                                .textTheme.titleLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          Text("Post",
                            style: Theme.of(context)
                                .textTheme.titleMedium?.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),)
                        ],
                      )
                    ),
                    Container(
                      height: size.height * .06,
                      width: 2,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("14K",
                            style: Theme.of(context)
                                .textTheme.titleLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          Text("Following",
                            style: Theme.of(context)
                                .textTheme.titleMedium?.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),)
                        ],
                      )
                    ),
                    Container(
                      height: size.height * .06,
                      width: 2,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text("11K",
                            style: Theme.of(context)
                                .textTheme.titleLarge?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          Text("Followers",
                            style: Theme.of(context)
                                .textTheme.titleMedium?.copyWith(color: Colors.grey,fontWeight: FontWeight.bold),)
                        ],
                      )
                    )
                  ],
                ),
                const SizedBox(height: kDefault * 2,),
                /**
                 * top title
                 */
                Wrap(
                  spacing: kDefault,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("COD", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                        const SizedBox(
                          width: kDefault * 4,
                          child:  Divider(thickness: 2,color: Colors.white,),
                        )
                      ],
                    ),
                    Text("Battlefield 2042", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                    Text("God of war", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                    Text("Tekken 7", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                  ],
                ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical:  kDefault * 2),
              child:  SizedBox(
                height: size.height * .6,
                width: double.infinity,
                child: GridView.builder(
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: .8,
                  ),
                  itemBuilder: (context, index) {
                    return PostCard(size: size);
                  },),
              ),
            )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(kDefault / 2),
          child: Image.network("https://pbblogassets.s3.amazonaws.com/uploads/2021/03/17162850/start-streaming.jpg",
            width: size.width * .4,
            height: size.height * .2,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: kDefault / 2,
          top: kDefault / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(kDefault),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
              child:  Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefault / 2,vertical: kDefault / 4),
                child: const Row(
                  children: [
                    Icon(Icons.visibility_outlined,color: Colors.white,),
                    SizedBox(width: kDefault / 6,),
                    Text("12.2k",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: kDefault / 2,
          right: size.width * .06,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefault / 2,vertical: kDefault / 6),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(kDefault / 2)
            ),
            child: const Text("Live",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          ),
        ),
         Positioned(
          bottom: size.height * .07,
          left: kDefault,
          child:  const Text("Naked Snake",
            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
