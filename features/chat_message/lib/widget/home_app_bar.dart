import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:core/core/constants/divider.dart';
import 'package:chat_message/provider/chat/chat_provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top * 1.2,
          ),

          ///title
          Consumer<ChatProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefault,),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(kCircle),
                          child: Image.network(
                            value.userData.imageUrl ??
                                'https://img.freepik.com/free-photo/handsome-cheerful-man-with-happy-smile_176420-18028.jpg',
                            fit: BoxFit.cover,
                            width: kDefault * 2.6,
                            height: kDefault * 2.6,
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: kDefault / 2),
                          child: Text(
                            "Chats",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.people_alt_outlined,
                      color: Colors.blue,
                      size: kDefault * 2,
                    )
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: kDefault / 1,
          ),

          ///search box
          Container(
            margin: const EdgeInsets.symmetric(horizontal: kDefault),
            padding: const EdgeInsets.symmetric(horizontal: kDefault),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.43),
                borderRadius: BorderRadius.circular(kDefault / 1)),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Search",
                  icon: Icon(Icons.search),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}