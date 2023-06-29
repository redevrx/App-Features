import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/component/widget/border_text.dart';
import 'package:meeting_room/component/widget/sliver_size_box.dart';
import 'package:meeting_room/theme/color.dart';

class MeetingDetailScreen extends StatelessWidget {
  const MeetingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultColor,
      body: CustomScrollView(
        slivers: [
          SliverSizeBox(
              child: Column(
            children: [
              ///image card room
              buildImageCardRoom(context),
              const SizedBox(height: kDefault,),
              ///calendar
              buildCalendarTitle(),
              const SizedBox(height: kDefault,),
              ///timeline
              buildTimelineBox()
            ],
          ),)
        ],
      ),
      floatingActionButton: actionButton(),
    );
  }

  Column buildTimelineBox() {
    return const Column(
              children: [
                ///time 8:00
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: kDefault * 2),
                      child: Text("08:00",style: TextStyle(color: Colors.white),),
                    ),
                    Expanded(child:  Divider(color: Colors.grey,)),
                    SizedBox(width: kDefault * 2,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: kDefault * 3.8,right: kDefault * 1.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '08:00 - 10:00',
                        verticalPadding: kDefault / 6,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '10:00 - 10:10',
                        verticalPadding: kDefault / 6,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '10:00 - 10:30',
                        verticalPadding: kDefault / 6,
                      ),
                    ],
                  ),
                ),
                ///time 12:00
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: kDefault * 2),
                      child: Text("12:00",style: TextStyle(color: Colors.white),),
                    ),
                    Expanded(child:  Divider(color: Colors.grey,)),
                    SizedBox(width: kDefault * 2,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: kDefault * 3.8,right: kDefault * 1.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '12:00 - 12:10',
                        verticalPadding: kDefault / 6,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '12:00 - 12:30',
                        verticalPadding: kDefault / 6,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '12:00 - 12:40',
                        verticalPadding: kDefault / 6,
                      ),
                    ],
                  ),
                ),
                ///time 11:00
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: kDefault * 2),
                      child: Text("12:00",style: TextStyle(color: Colors.white),),
                    ),
                    Expanded(child:  Divider(color: Colors.grey,)),
                    SizedBox(width: kDefault * 2,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: kDefault * 3.8,right: kDefault * 1.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '13:00 - 13:10',
                        verticalPadding: kDefault * 4,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '13:00 - 13:30',
                        verticalPadding: kDefault * 4,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '13:00 - 13:40',
                        verticalPadding: kDefault / 3,
                      ),
                    ],
                  ),
                ),
                ///time 14:00
                Row(
                  children: [
                    Padding(
                      padding:  EdgeInsets.only(right: kDefault * 2),
                      child: Text("08:00",style: TextStyle(color: Colors.white),),
                    ),
                    Expanded(child:  Divider(color: Colors.grey,)),
                    SizedBox(width: kDefault * 2,)
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: kDefault * 3.8,right: kDefault * 1.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '08:00 - 10:00',
                        verticalPadding: kDefault / 6,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '10:00 - 10:10',
                        verticalPadding: kDefault / 6,
                      ),
                      BorderText(
                        title: "Wed 13.00",
                        subTitle: '10:00 - 10:30',
                        verticalPadding: kDefault / 6,
                      ),
                    ],
                  ),
                ),
              ],
            );
  }

  Row buildCalendarTitle() {
    return Row(
              children: [
                const BorderText(
                  title: "Wed 13.00",
                  verticalPadding: kDefault / 3,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 3),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(kDefault),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: const Text('Wed 13.00',style: TextStyle(color: Colors.white),),
                )
              ],
            );
  }

  Container buildImageCardRoom(BuildContext context) {
    return Container(
              decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topLeft,
                    end: FractionalOffset.bottomRight,
                    colors: [
                      Colors.black,Colors.white12
                    ],
                  )
              ),
              child:  Stack(
                children: [
                  Image.network(
                    'https://www.decowoodveneers.com/images/Conference2.jpg',
                    fit: BoxFit.cover,
                  ),

                  ///menu
                  Positioned(
                    top: kToolbarHeight,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: kDefault),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         GestureDetector(
                           onTap: (){
                             Navigator.pop(context);
                           },
                           child: const Icon(
                             Icons.arrow_back_ios,
                             color: Colors.white,
                           ),
                         ),
                          Text(
                            "Meeting Room",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          const Icon(
                            Icons.menu,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),

                  ///room details
                  Positioned(
                    bottom: kToolbarHeight,
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: kDefault),
                      child: Column(
                        children: [
                          Text(
                            "Room #213",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          Text('1 floor', style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
  }

  FloatingActionButton actionButton() {
    return FloatingActionButton(
      onPressed: (){},
        backgroundColor:Colors.orange,
      child: const Icon(Icons.add),
    );
  }

}
