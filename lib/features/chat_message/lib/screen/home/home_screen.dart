import 'package:flutter/material.dart';
import 'package:chat_message/provider/chat/chat_provider.dart';
import 'package:chat_message/provider/nav/nav_provider.dart';
import 'package:provider/provider.dart';
import 'package:chat_message/widget/sliver_sized_box.dart';
import 'package:core/core/constants/divider.dart';
import 'package:chat_message/data/models/user/UserData.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(
          create: (context) => NavProvider(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ChatProvider chatProvider;
  late NavProvider navProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = Provider.of(context, listen: false);
    navProvider = Provider.of(context, listen: false);
    Future.delayed(const Duration(milliseconds: 350), () {
      chatProvider.currentUser();
      chatProvider.getUsers();
      chatProvider.getRooms();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverSizedBox(
            height: size.height * .9,
            child: Consumer<NavProvider>(
              builder: (context, value, child) {
                return IndexedStack(
                  index: value.index,
                  children: [
                    HomeContent(size: size),
                    const CreateRoom(),
                  ],
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: buildBottomBar(size),
    );
  }

  Widget buildBottomBar(Size size) {
    return Consumer<NavProvider>(
      builder: (context, value, child) {
        return Container(
          width: size.width * 1,
          height: size.height * .1,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefault, vertical: kDefault),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                offset: const Offset(.0, 3),
                color: Colors.black12.withOpacity(.23),
                blurRadius: kDefault)
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationItem(
                icon: Icons.chat,
                label: "Chat",
                isActive: value.index == 0,
                tab: () {
                  navProvider.tabChange(0);
                },
              ),
              NavigationItem(
                icon: Icons.call,
                label: "Call",
                isActive: value.index == 1,
                tab: () {
                  navProvider.tabChange(1);
                },
              ),
              NavigationItem(
                icon: Icons.people,
                label: "People",
                isActive: value.index == 2,
                tab: () {
                  navProvider.tabChange(2);
                },
              ),
              NavigationItem(
                icon: Icons.settings,
                label: "Settings",
                isActive: value.index == 3,
                tab: () {
                  navProvider.tabChange(3);
                },
              )
            ],
          ),
        );
      },
    );
  }
}

class CreateRoom extends StatelessWidget {
  const CreateRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /**
         * chat title page
         */
        Expanded(
          flex: 2,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),

              ///title
              Consumer<ChatProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefault),
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
        ),
        /**
         * content chat
         */
        Expanded(
          flex: 8,
          child: Consumer<ChatProvider>(
            builder: (context, value, child) {
              return StreamBuilder(
                stream: value.userStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return UserCreateChatRoomChat(
                          navProvider: Provider.of(context,listen: false),
                          chatProvider: Provider.of(context,listen: false),
                          userData: snapshot.data?[index],
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        )
      ],
    );
  }
}

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
              //create room success to home content
              navProvider.tabChange(0);
            },
            error: () {
              //show dialog error
              print("create room error");
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
        title: const Text("Title"),
        subtitle: const Text("subtitle"),
        trailing: Column(
          children: [
            const Text("19:30"),
            Container(
              width: kDefault / 2,
              height: kDefault / 2,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  const NavigationItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
    this.tab,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final Function()? tab;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tab,
      child: Column(
        children: [
          Icon(
            icon,
            color: isActive ? Colors.blueAccent : null,
          ),
          Text(label)
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /**
         * chat title page
         */
        Expanded(
          flex: 2,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),

              ///title
              Consumer<ChatProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefault),
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
        ),
        /**
         * content chat
         */
        Expanded(
          flex: 8,
          child: Consumer<ChatProvider>(
            builder: (context, value, child) {
              return StreamBuilder(
                stream: value.rooms,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(kCircle),
                            child: Image.network(
                              snapshot.data?[index].receiverImgUrl ??
                                  'https://img.freepik.com/free-photo/close-up-portrait-smiling-young-woman-looking-camera_171337-17994.jpg',
                              fit: BoxFit.cover,
                              width: kCircle,
                              height: kCircle,
                            ),
                          ),
                          title: Text(snapshot.data?[index].receiverName ??"user name"),
                          subtitle: Text(snapshot.data?[index].lastMessage ?? "subtitle"),
                          trailing: Column(
                            children: [
                              Text(snapshot.data?[index].sendTime?.split(" ")[1].split('.')[0] ?? "19:30"),
                              Container(
                                width: kDefault / 2,
                                height: kDefault / 2,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueAccent),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              );
            },
          ),
        )
      ],
    );
  }
}
