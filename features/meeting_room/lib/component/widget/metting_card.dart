import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/data/model/room_data.dart';
import 'package:meeting_room/screen/meeting_detail_screen.dart';
import 'package:meeting_room/theme/color.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({
    super.key,
    required this.size, required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const MeetingDetailScreen(),));
      },
      child: Stack(
        children: [
          index % 2 == 0 ?  const SizedBox() : Positioned(
            bottom: -1,
            left: 0,
            right: 0,
            child:  Container(
              width: size.width,
              height: size.height * .1,
              margin: const EdgeInsets.symmetric(horizontal: kDefault * 2),
              decoration:  BoxDecoration(
                color:  rooms[index].color.withOpacity(.45),
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
                color: rooms[index].color,
                borderRadius: BorderRadius.circular(kDefault),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0,.3),
                      color: rooms[index].color.withOpacity(.23),
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
                    Text(rooms[index].room),
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
      ),
    );
  }
}