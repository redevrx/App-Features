import 'package:flutter/material.dart';
import 'package:tiktok/data/extension/size_response.dart';

class TiktokNavItemWidget extends StatelessWidget {
  const TiktokNavItemWidget(
      {super.key,
        required this.size,
        this.icon,
        required this.label,
        this.imgPath,
        this.onTab,
        required this.isSelect});

  final Size size;
  final IconData? icon;
  final String label;
  final String? imgPath;
  final Function()? onTab;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon == null
              ? Image.asset(
            '$imgPath',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          )
              : Icon(
            icon,
            color: isSelect ? Colors.white : Colors.grey,
            size: 28,
          ),
          label.isNotEmpty
              ? Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: isSelect ? Colors.white : Colors.grey,fontSize: 9),
          )
              : const SizedBox()
        ],
      ),
    );
  }
}