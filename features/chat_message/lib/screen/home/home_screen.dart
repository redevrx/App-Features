import 'package:flutter/material.dart';
import 'package:chat_message/provider/chat/chat_provider.dart';
import 'package:chat_message/provider/nav/nav_provider.dart';
import 'package:provider/provider.dart';
import 'package:chat_message/widget/sliver_sized_box.dart';
import 'package:core/core/constants/divider.dart';
import 'package:chat_message/widget/create_room.dart';
import 'package:chat_message/widget/navigation_item.dart';
import 'package:chat_message/widget/home_content.dart';

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
      resizeToAvoidBottomInset: true,
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
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBottomBar() {
    return Container(
      padding: const EdgeInsets.only(
        right: kDefault,
        left: kDefault,
        top: kDefault / 2,
        bottom: kDefault * 1.4
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(.0, 3),
                color: Colors.black12.withOpacity(.23),
                blurRadius: kDefault)
          ]),
      child: Consumer<NavProvider>(
        builder: (context, value, child) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
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
          );
        },
      ),
    );
  }
}



