import 'package:core/core/constants/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room/component/widget/metting_card.dart';
import 'package:meeting_room/component/widget/sliver_size_box.dart';
import 'package:meeting_room/data/model/room_data.dart';
import 'package:meeting_room/theme/color.dart';

class MeetingRoomScreen extends StatefulWidget {
  const MeetingRoomScreen({super.key});

  @override
  State<MeetingRoomScreen> createState() => _MeetingRoomScreenState();
}

class _MeetingRoomScreenState extends State<MeetingRoomScreen> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kDefaultColor,
      body: CustomScrollView(
        slivers: [
          SliverSizeBox(
              height: size.height,
              child: Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: kToolbarHeight,),
                      buildAppbar(),
                      const SizedBox(height: kDefault,),
                      buildMeetingTitle(context),
                      ///title card room
                      buildRoomList(size)
                    ],
                  ),
                  buildNavigationBar()
                ],
              )
          )
        ],
      ),
    );
  }

  Align buildNavigationBar() {
    return Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: kDefault,
                      right: kDefault,
                      bottom: kDefault * 1.4,),
                    padding: const EdgeInsets.symmetric(horizontal:kDefault * 1.4,vertical: kDefault),
                    decoration: BoxDecoration(
                        color: kBodyColor,
                        borderRadius: BorderRadius.circular(kDefault * 2),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0,.3),
                              color: kDefaultColor.withOpacity(.23),
                              blurRadius: 12.0
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NavItem(
                          title: 'Home',
                          icon: Icons.home_max_sharp,
                          isSelect: _index == 0 ? true : false,
                          onTab: (){
                            setState(() {
                              _index = 0;
                            });
                          },
                        ),
                        NavItem(
                          title: 'Meeting',
                          icon: Icons.meeting_room_outlined,
                          isSelect: _index == 1 ? true : false,
                          onTab: (){
                            setState(() {
                              _index = 1;
                            });
                          },
                        ),
                        NavItem(
                          title: 'Person',
                          icon: Icons.people_alt_outlined,
                          isSelect: _index == 2 ? true : false,
                          onTab: (){
                            setState(() {
                              _index = 2;
                            });
                          },
                        ),
                        NavItem(
                          title: 'Setting',
                          icon: Icons.settings_outlined,
                          isSelect: _index == 3 ? true : false,
                          onTab: (){
                            setState(() {
                              _index = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
  }

  Padding buildAppbar() {
    return Padding(
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
                );
  }

  Padding buildMeetingTitle(BuildContext context) {
    return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Meeting Rooms (5)",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey),),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              ///open create meeting popup
                              createMeetingPopup(context: context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(kDefault / 2),
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.orange)
                              ),
                              child: const Icon(Icons.add,color: Colors.orange,),
                            ),
                          ),
                          const Spacer(flex: 6,)
                        ],
                      ),
                      const SizedBox(height: kDefault / 1.2,),
                      Text("Here you can choose meeting rooms\nlook and invite people to meeting",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),)
                    ],
                  ),
                );
  }

  Expanded buildRoomList(Size size) {
    return Expanded(
                  child: ListView.builder(
                    itemCount: rooms.length,
                    itemBuilder: (context, index) {
                      return MeetingCard(size: size,index: index,);
                    },
                  ),
                );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key, required this.icon, required this.title, this.isSelect = false, this.onTab,
  });

  final IconData icon;
  final String title;
  final bool isSelect;
  final Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,color: isSelect ? Colors.orangeAccent : Colors.grey,),
          isSelect ? Container(
            margin: const EdgeInsets.only(top: kDefault / 4),
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle
            ),
          ) : Text(title,style: const TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}


void createMeetingPopup({required BuildContext context}){
   showGeneralDialog<void>(
      context: context,
      transitionDuration: const Duration(milliseconds: 750),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.translate(
          offset: Offset(0,30 * animation.value),
          child: child,
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) {
        return Material(
          color: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(top: kToolbarHeight * 2),
            padding: const EdgeInsets.all(kDefault),
            decoration: BoxDecoration(
              color: kBodyColor,
              borderRadius: BorderRadius.circular(kDefault / 2)
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///button close and save
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: const Text("Back",style: TextStyle(color: Colors.orange),)
                        ,),
                      const Text("New Meeting",style: TextStyle(color: Colors.white),),
                      TextButton(
                        onPressed: (){},
                        child: const Text("Save",style: TextStyle(color: Colors.orange),)
                        ,),
                    ],
                  ),
                  const SizedBox(height: kDefault,),
                  ///title
                  const Text('Create a new meeting',style: TextStyle(color: Colors.white),),
                  const SizedBox(height: kDefault / 2,),
                  const Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey,))
                    ],
                  ),
                  const SizedBox(height: kDefault,),
                  ///input txt meeting title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Meeting Title*",style: TextStyle(color: Colors.white)),
                      Container(
                        margin: const EdgeInsets.only(top: kDefault / 2),
                        padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /6),
                        decoration: BoxDecoration(
                          color: kDefaultColor,
                          borderRadius: BorderRadius.circular(kDefault)
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Meeting Title",
                            hintStyle: TextStyle(color: Colors.white),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            disabledBorder: InputBorder.none
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: kDefault,),
                  ///description input box
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Description",style: TextStyle(color: Colors.white),),
                      Container(
                        margin: const EdgeInsets.only(top: kDefault / 2),
                        padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /2),
                        decoration: BoxDecoration(
                            color: kDefaultColor,
                            borderRadius: BorderRadius.circular(kDefault)
                        ),
                        child: TextFormField(
                          maxLines: 4,
                          decoration: const InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              disabledBorder: InputBorder.none
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: kDefault,),
                  ///Reference input box
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Reference",style: TextStyle(color: Colors.white),),
                      Container(
                        margin: const EdgeInsets.only(top: kDefault / 2),
                        padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /6),
                        decoration: BoxDecoration(
                            color: kDefaultColor,
                            borderRadius: BorderRadius.circular(kDefault)
                        ),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Reference",
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none
                              ),
                            ),),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle
                              ),
                              child: Icon(Icons.add),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: kDefault,),
                  ///dates
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///date
                     Expanded(child:  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Date",style: TextStyle(color: Colors.white),),
                         Container(
                           margin: const EdgeInsets.only(top: kDefault / 2),
                           padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /6),
                           decoration: BoxDecoration(
                               color: kDefaultColor,
                               borderRadius: BorderRadius.circular(kDefault)
                           ),
                           child: TextFormField(
                             decoration: const InputDecoration(
                                 hintText: "Reference",
                                 hintStyle: TextStyle(color: Colors.white),
                                 enabledBorder: InputBorder.none,
                                 focusedBorder: InputBorder.none,
                                 disabledBorder: InputBorder.none
                             ),
                           ),
                         )
                       ],
                     )),
                      ///beginning
                     Expanded(
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal:kDefault),
                         child:  Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             const Text("beginning",style: TextStyle(color: Colors.white),),
                             Container(
                               margin: const EdgeInsets.only(top: kDefault / 2),
                               padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /6),
                               decoration: BoxDecoration(
                                   color: kDefaultColor,
                                   borderRadius: BorderRadius.circular(kDefault)
                               ),
                               child: TextFormField(
                                 decoration: const InputDecoration(
                                     hintText: "11:00",
                                     hintStyle: TextStyle(color: Colors.white),
                                     enabledBorder: InputBorder.none,
                                     focusedBorder: InputBorder.none,
                                     disabledBorder: InputBorder.none
                                 ),
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                      /// - you can using stack
                      ///ending
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("ending",style: TextStyle(color: Colors.white),),
                          Container(
                            margin: const EdgeInsets.only(top: kDefault / 2),
                            padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /6),
                            decoration: BoxDecoration(
                                color: kDefaultColor,
                                borderRadius: BorderRadius.circular(kDefault)
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "13:30",
                                  hintStyle: TextStyle(color: Colors.white),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none
                              ),
                            ),
                          )
                        ],
                      )),
                    ],
                  ),
                  const SizedBox(height: kDefault / 2,),
                  Row(
                    children: [
                      CupertinoCheckbox(value: false, onChanged: (it) {},inactiveColor: Colors.orange),
                      const Text("Accept",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                  const SizedBox(height: kDefault,),
                  ///add people
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Add an People",style: TextStyle(color: Colors.white)),
                      Container(
                        margin: const EdgeInsets.only(top: kDefault / 2),
                        padding: const EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault /6),
                        decoration: BoxDecoration(
                            color: kDefaultColor,
                            borderRadius: BorderRadius.circular(kDefault)
                        ),
                        child: Row(
                          children: [
                            Expanded(child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Add ...",
                                  hintStyle: TextStyle(color: Colors.grey,fontSize: 12),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none
                              ),
                            )),
                            Container(
                              margin: const EdgeInsets.only(
                                left: kDefault * 2,
                                right: kDefault
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.orange,
                                shape: BoxShape.circle
                              ),
                              child: const Icon(Icons.arrow_forward,),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: kDefault / 2,),
                  const Wrap(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kDefault / 6),
                        child: SizedBox(
                          width: kCircle,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kDefault / 6),
                        child: SizedBox(
                          width: kCircle,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kDefault / 6),
                        child: SizedBox(
                          width: kCircle,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kDefault / 6),
                        child: SizedBox(
                          width: kCircle,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: kDefault / 6),
                        child: SizedBox(
                          width: kCircle,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage("https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528"),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: kDefault / 2,),
                  Row(
                    children: [
                      CupertinoCheckbox(value: false, onChanged: (it) {},inactiveColor: Colors.orange,),
                      const Text("Accept",style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
  );
}

