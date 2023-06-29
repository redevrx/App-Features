import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';

class BorderText extends StatelessWidget {
  const BorderText({
    super.key, required this.title, this.color = Colors.grey, required this.verticalPadding, this.subTitle,
  });

  final String title;
  final String? subTitle;
  final Color color;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 8),
      padding: verticalPadding > 16 ?EdgeInsets.only(
          right: kDefault,
          left: kDefault,
          bottom: verticalPadding,
          top: kDefault / 3
      ) :EdgeInsets.symmetric(horizontal: kDefault,vertical: verticalPadding),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kDefault)
      ),
      child: subTitle != null ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('$subTitle')
        ],
      ):Text(title),
    );
  }
}