import 'dart:async';
import 'package:chat_bot/model/message_model.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:core/core/constants/divider.dart';
import 'package:core/core/temp.dart';
import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final txtMessage = TextEditingController();
  late OpenAI openAI;

  ///open ai api key
  final apiKey = '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';

  ///list messages
  final messages = [MessageModel(true, 'Hi.')];


  void sendMessage(String message) async{
    final request = CompleteText(prompt: message, model: TextDavinci3Model(),maxTokens: 2000);
    final response = await openAI.onCompletion(request: request);
    setState(() {
      messages.add(MessageModel(true,"${response?.choices.last.text}"));
    });
  }

  @override
  void initState() {
    openAI = OpenAI.instance.build(token: apiKey);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              _appBar(context),
              /**
               * list view
               */
              _messageList(),
            ],
          ),
          /**
           * bottom navigation
           */
          _bottomNavigation(context),
        ],
      ),
    );
  }

  Expanded _messageList() {
    return Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kDefault * 4),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return messages[index].isBot
                        ? _botCard(index: index)
                        : _userCard(index: index);
                  },
                ),
              ),
            );
  }

  Padding _userCard({required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
              backgroundImage: NetworkImage(kUrlProfile),
            ),
          ),
          Positioned(
              right: kHeight,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefault * 1.1, vertical: kDefault / 1.2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(kDefault * 1.8)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(.12),
                              offset: const Offset(.5, kDefault / 1.6),
                              blurRadius: kDefault * 2)
                        ]),
                    child: Text(messages[index].message),
                  )
                ],
              ))
        ],
      ),
    );
  }

  Padding _botCard({required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault),
      child: Stack(
        children: [
          const CircleAvatar(
              child: Icon(
            Icons.person,
            size: kDefault * 1.6,
          )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefault * 3.6),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefault * 1.1, vertical: kDefault / 1.2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(kDefault * 1.8)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.14),
                      offset:
                      const Offset(0,0),
                      blurRadius: kDefault * 1)
                ]),
            child: Text(messages[index].message.replaceAll('/[a-zA-Z0-9\b\0 ]/;', ''),maxLines: 12,),
          )
        ],
      ),
    );
  }

  Align _bottomNavigation(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * .08,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefault * 1.5, vertical: kDefault / 1.6),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(kDefault),
                topLeft: Radius.circular(kDefault)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.23),
                  offset: const Offset(.5, kDefault / 1.2),
                  blurRadius: kDefault)
            ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.12),
              borderRadius: BorderRadius.circular(kDefault)),
          child: TextField(
              controller: txtMessage,
              decoration:  InputDecoration(
                  suffixIcon: GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                      sendMessage(txtMessage.text.toString());
                      setState(() {
                        messages.add(MessageModel(false, txtMessage.text.toString()));
                        txtMessage.text = '';
                      });
                    },
                    child: const Icon(
                      Icons.send,
                      size: kDefault * 1.6,
                      color: Colors.blue,
                    )
                  ),
                  hintText: '    ...A',
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none)),
        ),
      ),
    );
  }

  Expanded _appBar(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefault, vertical: kDefault / 2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(kDefault),
                bottomLeft: Radius.circular(kDefault)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(.13),
                  offset: const Offset(.5, 2),
                  blurRadius: kDefault * 2)
            ]),
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: kDefault * 1.6,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefault),
              child: CircleAvatar(
                backgroundImage: NetworkImage(kUrlProfile),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ChatGPT",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: Colors.black),
                ),
                Text(
                  "Online",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      ?.copyWith(color: Colors.green),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
