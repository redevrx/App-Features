import 'package:flutter/material.dart';

class ChipTextData {
  final String title;
  final IconData icon;

  ChipTextData({required this.title, required this.icon});
}

final chipTextDataList = [
  ChipTextData(title: 'Popular', icon: Icons.local_fire_department_outlined),
  ChipTextData(title: 'Gaming', icon: Icons.local_fire_department_outlined),
  ChipTextData(title: 'COD', icon: Icons.local_fire_department_outlined),
  ChipTextData(title: 'Battlefield 2042', icon: Icons.local_fire_department_outlined),
];