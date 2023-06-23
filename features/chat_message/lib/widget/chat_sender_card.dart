import 'package:flutter/material.dart';
import 'package:chat_message/data/models/chat/message/message_data.dart';
import 'package:chat_message/data/models/user/UserData.dart';
import 'package:core/core/constants/divider.dart';

class ChatCardSender extends StatelessWidget {
  const ChatCardSender({
    super.key,
    required this.message,
    required this.currentUser,
  });

  final MessageData? message;
  final UserData currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefault * 1.4),
      child: Row(
        children: [
          SizedBox(
            width: kCircle,
            height: kCircle,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                currentUser.imageUrl ??
                    'https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg',
              ),
              radius: kCircle,
            ),
          ),
          Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefault * 1.2, vertical: kDefault),
                margin: const EdgeInsets.only(left: kDefault / 2),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kDefault),
                        bottomRight: Radius.circular(kDefault))),
                child: Text(message?.message ?? 'unknown'),
              ))
        ],
      ),
    );
  }
}