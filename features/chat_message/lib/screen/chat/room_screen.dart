import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_message/provider/chat/chat_provider.dart';
import 'package:chat_message/widget/sliver_sized_box.dart';
import 'package:core/core/constants/divider.dart';
import 'package:chat_message/data/models/chat/room/room_data.dart';
import 'package:chat_message/data/models/chat/message/message_data.dart';
import 'package:chat_message/widget/chat_receiver_card.dart';
import 'package:chat_message/widget/chat_sender_card.dart';

class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key, required this.roomData});

  final RoomData roomData;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        )
      ],
      child: RoomView(
        roomData: roomData,
      ),
    );
  }
}

class RoomView extends StatefulWidget {
  const RoomView({super.key, required this.roomData});

  final RoomData roomData;

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  late ChatProvider chatProvider;
  late TextEditingController txtMessage;

  @override
  void initState() {
    chatProvider = Provider.of(context, listen: false);
    txtMessage = TextEditingController();
    super.initState();

    Future.delayed(const Duration(milliseconds: 320), () {
      chatProvider.currentUser();
      chatProvider.getMessages(widget.roomData.roomId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSizedBox(
            height: size.height,
            child: Column(
              children: [
                ///appbar
                buildRoomAppBar(context),
                Expanded(
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: kDefault),
                      color: Colors.grey.withOpacity(.06),
                      child: Consumer<ChatProvider>(
                        builder: (context, value, child) {
                          return StreamBuilder<List<MessageData>>(
                            stream: value.sMessages,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.active) {
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: snapshot.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                    return snapshot.data?[index].senderId ==
                                            widget.roomData.receiverId
                                        ///check sender or receiver type for message
                                        ? ChatCardSender(
                                            message: snapshot.data?[index],
                                            currentUser: value.userData,
                                          )
                                        : ChatCardReceiver(
                                            message: snapshot.data?[index],
                                            room: widget.roomData,
                                          );
                                  },
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          );
                        },
                      )),
                ),

                ///bottom message input
                buildMessageInputBox(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildMessageInputBox(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          left: kDefault,
          right: kDefault,
          top: kDefault / 2,
          bottom: kDefault * 1.4),
      color: Colors.white,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child: Consumer<ChatProvider>(
            builder: (context, value, child) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: kDefault),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.23),
                  borderRadius: BorderRadius.circular(kDefault),
                ),
                child: TextFormField(
                  controller: txtMessage,
                  enabled: value.isEnableMessage,
                  onChanged: (it) => chatProvider.messageChange(it),
                  onFieldSubmitted: (it){
                    ///disable message input box
                    chatProvider.enableMessageBoxChange(false);

                    ///send message
                    chatProvider.send(
                        '${widget.roomData.roomId}', '${widget.roomData.senderId}',
                        success: () {
                          ///enable message input box
                          chatProvider.enableMessageBoxChange(true);
                        }, failure: () {
                      ///show snackbar
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Send Message Failure!')));

                      ///enable message input box
                      chatProvider.enableMessageBoxChange(true);
                    });

                    ///clear message
                   txtMessage.clear();
                  },
                  decoration: const InputDecoration(
                      hintText: '    A ...',
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none),
                ),
              );
            },
          )),
          InkWell(
            onTap: () {
              ///disable message input box
              chatProvider.enableMessageBoxChange(false);

              ///send message
              chatProvider.send(
                  '${widget.roomData.roomId}', '${widget.roomData.senderId}',
                  success: () {
                ///enable message input box
                chatProvider.enableMessageBoxChange(true);
              }, failure: () {
                ///show snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Send Message Failure!')));

                ///enable message input box
                chatProvider.enableMessageBoxChange(true);
              });

              ///clear message
             txtMessage.clear();
            },
            child: Transform.rotate(
              angle: -pi / 50,
              child: const Icon(
                Icons.send_outlined,
                color: Colors.blueAccent,
                size: kDefault * 1.8,
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding buildRoomAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: kDefault,
          right: kDefault,
          top: MediaQuery.of(context).padding.top * 1.2,
          bottom: kDefault / 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.blueAccent,
            ),
          ),

          ///user avatar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefault / 2),
            child: SizedBox(
              width: kCircle,
              height: kCircle,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.roomData.receiverImgUrl ??
                      'https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg',
                ),
                radius: kCircle,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.roomData.receiverName}"),
              Text(
                "Active",
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
