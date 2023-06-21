import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_message/provider/chat/chat_provider.dart';
import 'package:chat_message/widget/sliver_sized_box.dart';
import 'package:core/core/constants/divider.dart';
import 'package:chat_message/data/models/user/UserData.dart';
import 'package:core/core/constants/divider.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        )
      ],
      child: const RoomView(),
    );
  }
}

class RoomView extends StatefulWidget {
  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  late ChatProvider chatProvider;

  @override
  void initState() {
    chatProvider = Provider.of(context,listen: false);
    super.initState();

    chatProvider.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSizedBox(
            height: size.height,
            child: Stack(
              children: [
                Column(
                  children: [
                    ///appbar
                    Expanded(
                      child: Padding(
                        padding:  EdgeInsets.only(left: kDefault,right: kDefault,top: MediaQuery.of(context).padding.top,bottom: kDefault / 2),
                        child: Consumer<ChatProvider>(
                          builder: (context, value, child) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(Icons.arrow_back,color: Colors.blueAccent,),
                                ///user avatar
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: kDefault / 2),
                                  child: SizedBox(
                                    width: kCircle,
                                    height: kCircle,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(value.userData.imageUrl ?? 'https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg',),
                                      radius: kCircle,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("${value.userData.username}"),
                                    const Text("Active")
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: kDefault),
                        color: Colors.grey.withOpacity(.06),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 12,
                          itemBuilder: (context, index) {
                            return index % 2 == 0 ? ChatCardSender() : ChatCardReceiver();
                          },
                        ),
                      ),
                    ),
                  ],
                ),

               ///bottom input message
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   padding: const EdgeInsets.all(kDefault * 1.2),
                   color: Colors.white,
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       Container(
                         padding: const EdgeInsets.all(kDefault / 4),
                         margin: const EdgeInsets.only(right: kDefault / 3),
                         width: size.width * .82,
                         decoration: BoxDecoration(
                           color: Colors.grey.withOpacity(.23),
                           borderRadius: BorderRadius.circular(kDefault),
                         ),
                         child: TextFormField(
                           decoration: const InputDecoration(
                               hintText: '    A ...',
                               border: InputBorder.none,
                               enabledBorder: InputBorder.none,
                               focusedBorder: InputBorder.none,
                               disabledBorder: InputBorder.none
                           ),
                         ),
                       ),
                      InkWell(
                        onTap: (){},
                        child: Transform.rotate(
                          angle: -pi / 50,
                          child:  const Icon(Icons.send_outlined,color: Colors.blueAccent,size: kDefault * 1.8,),
                        ),
                      )
                     ],
                   ),
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

class ChatCardReceiver extends StatelessWidget {
  const ChatCardReceiver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: kDefault * 1.4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefault * 1.2,vertical: kDefault),
          margin: const EdgeInsets.only(right: kDefault / 2),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefault),
                  bottomRight: Radius.circular(kDefault)
              )
          ),
          child: const Text('Hello World'),
        )),
        const SizedBox(
          width: kCircle,
          height: kCircle,
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg',),
            radius: kCircle,
          ),
        ),
      ],
    ),);
  }
}

class ChatCardSender extends StatelessWidget {
  const ChatCardSender({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(top: kDefault * 1.4),
      child: Row(
      children: [
        const SizedBox(
          width: kCircle,
          height: kCircle,
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg',),
            radius: kCircle,
          ),
        ),
        Flexible(child: Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefault * 1.2,vertical: kDefault),
          margin: const EdgeInsets.only(left: kDefault / 2),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefault),
                  bottomRight: Radius.circular(kDefault)
              )
          ),
          child: const Text('Hello World'),
        ))
      ],
    ),);
  }
}
