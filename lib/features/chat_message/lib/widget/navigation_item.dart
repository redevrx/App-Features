import 'package:flutter/material.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isActive ? Colors.blueAccent : null,
          ),
          Text(label,style: Theme.of(context).textTheme.bodySmall,)
        ],
      ),
    );
  }
}