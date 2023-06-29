import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/theme/color.dart';

class MeetingRoomScreen extends StatelessWidget {
  const MeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDefaultColor,
      body: CustomScrollView(
        slivers: [
          SliverSizeBox(
              height: size.height,
              child: Column(
                children: [
                  const SizedBox(height: kToolbarHeight,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(kCircle),
                          child: Image.network('https://img.freepik.com/free-photo/close-up-portrait-smiling-young-woman-looking-camera_171337-17994.jpg',
                            fit: BoxFit.cover,
                            height: kHeight - 5,
                            width: kHeight - 5,),
                        ),
                       Container(
                         padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 2),
                         decoration: BoxDecoration(
                           color: Colors.transparent,
                           borderRadius: BorderRadius.circular(kDefault),
                           border: Border.all(color: Colors.orange)
                         ),
                         child: Text('Legnicka 56-54 wroclaw',style: TextStyle(color: Colors.orange),),
                       )
                      ],
                    ),
                  ),
                  const SizedBox(height: kDefault,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Meeting Rooms (5)",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.all(kDefault / 2),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.orange)
                              ),
                              child: const Icon(Icons.add,color: Colors.orange,),
                            ),
                            const Spacer(flex: 6,)
                          ],
                        ),
                        const SizedBox(height: kDefault / 1.2,),
                        Text("Here you can choose meeting rooms\nlook and invite people to meeting",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),)
                      ],
                    ),
                  ),
                  ///title card room
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                           Positioned(
                             bottom: -1,
                             left: 0,
                             right: 0,
                             child:  Container(
                               width: size.width,
                               height: size.height * .1,
                               margin: const EdgeInsets.symmetric(horizontal: kDefault * 2),
                               decoration:  BoxDecoration(
                                   color: Colors.white.withOpacity(.45),
                                   borderRadius: const BorderRadius.only(
                                     bottomLeft: Radius.circular(kDefault),
                                     bottomRight: Radius.circular(kDefault),
                                   ),
                               ),
                             ),
                           ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 2),
                              padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault * 1.5),
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(kDefault),
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0,.3),
                                        color: Colors.white.withOpacity(.23),
                                        blurRadius: 18.0
                                    )
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Room #12"),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical:kDefault / 2,horizontal: kDefault / 1.2),
                                        decoration: BoxDecoration(
                                            color: kBodyColor,
                                            borderRadius: BorderRadius.circular(kDefault * 2)
                                        ),
                                        child: Row(
                                          children: [
                                            const Text("Go",style: TextStyle(color: Colors.white),),
                                            Container(
                                              margin: const EdgeInsets.only(left: kDefault / 4),
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(kDefault)
                                              ),
                                              child: const Icon(Icons.arrow_forward),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Text("1 floor"),
                                  const SizedBox(height: kDefault,),
                                  Wrap(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 3),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(kDefault),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Text("<10 persons"),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: kDefault / 2),
                                        padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 3),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(kDefault),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Text("10 persons"),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 3),
                                        decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(kDefault),
                                            border: Border.all(color: Colors.black)
                                        ),
                                        child: const Text("10 persons"),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
          )
        ],
      ),
    );
  }
}

class SliverSizeBox extends StatelessWidget {
  const SliverSizeBox({super.key, this.width = double.infinity, required this.height, required this.child});

  final double width;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: width,
        height: height,
        child: child,
      ),
    );
  }
}

