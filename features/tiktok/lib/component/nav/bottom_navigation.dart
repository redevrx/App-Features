import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/component/nav/nav_item_widget.dart';

import '../../provider/nav/nav_provider.dart';

class TiktokBottomNavigation extends StatelessWidget {
  const TiktokBottomNavigation(
      {super.key, required this.size, required this.selectIndex});

  final Size size;
  final int selectIndex;

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<NavProvider>();
    return Container(
      padding: const EdgeInsets.only(
          left: kDefault + 5,
          right: kDefault + 5,
          bottom: kDefault + kDefault - 2,
          top: kDefault / 2),
      width: double.infinity,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //nav item
          TiktokNavItemWidget(
            size: size,
            icon: Icons.home,
            label: "Home",
            isSelect: selectIndex == 0,
            onTab: ()=> navProvider.onChangePage(0),
          ),
          TiktokNavItemWidget(
            size: size,
            icon: Icons.search,
            label: "Discover",
            isSelect: selectIndex == 1,
            onTab: ()=> navProvider.onChangePage(1),
          ),
          TiktokNavItemWidget(
            size: size,
            imgPath: "assets/tiktok/icon_add.png",
            label: "",
            isSelect: selectIndex == 2,
            onTab: ()=> navProvider.onChangePage(2),
          ),
          TiktokNavItemWidget(
            size: size,
            icon: Icons.indeterminate_check_box_outlined,
            label: "Inbox",
            isSelect: selectIndex == 3,
            onTab: ()=> navProvider.onChangePage(3),
          ),
          TiktokNavItemWidget(
            size: size,
            icon: Icons.person,
            label: "Me",
            isSelect: selectIndex == 4,
            onTab: ()=> navProvider.onChangePage(4),
          )
        ],
      ),
    );
  }
}