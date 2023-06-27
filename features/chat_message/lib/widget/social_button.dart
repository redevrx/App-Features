import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key, this.onTap, required this.iconData, required this.color,
  });

  final Function()? onTap;
  final IconData iconData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal:kDefault / 2),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.23),
            borderRadius: BorderRadius.circular(kDefault / 1.2),
            border: Border.all(color: Colors.grey,width: 1.5)
        ),
        child:  Padding(
          padding: const EdgeInsets.all(kDefault / 1.4),
          child: Icon(
            iconData,
            color: color,
          ),
        ),
      ),
    );
  }
}