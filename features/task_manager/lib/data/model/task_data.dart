import 'package:flutter/material.dart';

class TaskData {
  final Color dotColor;
  final Color progressColor;
  final double progress;
  final String title;
  final String subTitle;
  final IconData icon;
  final String progressText;

  TaskData(
      {required this.dotColor,
      required this.progressColor,
      required this.progress,
      required this.title,
      required this.subTitle,
      required this.icon,
      required this.progressText});
}

final taskList = [
  TaskData(
      dotColor: Colors.blueAccent,
      progressColor: Colors.blueAccent,
      progress: 150.0,
      title: "Learn Java",
      subTitle: 'Complete Progress.',
  progressText: "4/10",
  icon: Icons.task_alt),
  TaskData(
      dotColor: Colors.orange,
      progressColor: Colors.orange,
      progress: 280.0,
      title: "Learn Flutter",
      subTitle: 'Complete Progress.',
  progressText: '8/10',
  icon: Icons.flutter_dash),
  TaskData(
      dotColor: Colors.green,
      progressColor: Colors.green,
      progress: 240.0,
      title: "Learn Jetpack Compose",
      subTitle: 'Complete Progress.',
  progressText: '7/10',
  icon: Icons.android),
  TaskData(
      dotColor: Colors.deepPurple,
      progressColor: Colors.deepPurple,
      progress: 260.0,
      title: "Learn Kotlin",
      subTitle: 'Complete Progress.',
      progressText: '6/10',
      icon: Icons.android),
];
