import 'package:chat_message/provider/chat/chat_provider.dart';
import 'package:chat_message/provider/nav/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:core/core/constants/divider.dart';
import 'package:chat_message/data/models/user/UserData.dart';

class UserCreateChatRoomChat extends StatelessWidget {
  const UserCreateChatRoomChat({
    super.key,
    this.userData,
    required this.chatProvider, required this.navProvider,
  });

  final UserData? userData;
  final ChatProvider chatProvider;
  final NavProvider navProvider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ///create chat room here
        if (userData == null) {
          return;
        }

        chatProvider.createChatRoom(
            userData: userData!,
            success: () {
              ///create room success to home content
              navProvider.tabChange(0);
            },
            error: () {
              ///show dialog error
              const snackBar = SnackBar(
                content: Text('Create Chat Room Failure!'),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            });
      },
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(kCircle),
          child: Image.network(
            userData?.imageUrl ??
                'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-woman-looking-camera_171337-17994.jpg',
            fit: BoxFit.cover,
            width: kCircle,
            height: kCircle,
          ),
        ),
        title:  Text(userData?.username ?? 'username'),
      ),
    );
  }
}