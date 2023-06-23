import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/widget/circle4_point.dart';
import 'package:task_manager/component/widget/date_card.dart';
import 'package:task_manager/data/model/date_data.dart';
import 'package:task_manager/data/model/task_data.dart';

import '../component/widget/task_card.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          ///appbar
          buildAppBar(context, size),

          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),

                ///progress card
                buildProgressCard(size),
                ///list task
                buildTaskList(size)
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:ElevatedButton(
        onPressed: () {  },
        style: ElevatedButton.styleFrom(
            elevation: 8,
            shadowColor: Colors.indigoAccent,
            backgroundColor: Colors.indigoAccent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kDefault / 2)
            )
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal:kDefault / 6,vertical: kDefault / 1.2),
          child: Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: Container(
        height: 86.0,
        padding: const EdgeInsets.only(
          right: kDefault,
          bottom: kDefault,
          left: kDefault,
          top: kDefault / 2
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, .3),
              color: Colors.grey.withOpacity(.23),
              blurRadius: 8.0
            )
          ]
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home_filled,size: kCircle / 1.6),
            Icon(Icons.add_task_rounded,size: kCircle / 1.6,)
          ],
        ),
      ),
    );
  }

  Expanded buildTaskList(Size size) {
    return Expanded(
                  child: Center(
                    child: ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return TaskCard(size: size,index:index);
                      },
                    ),
                  ));
  }

  Container buildProgressCard(Size size) {
    return Container(
                width: size.width * .9,
                padding: const EdgeInsets.symmetric(
                    vertical: kDefault / 1.4, horizontal: kDefault),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(kDefault * 2),
                        bottomLeft: Radius.circular(kDefault * 2),
                        bottomRight: Radius.circular(kDefault / 2),
                        topRight: Radius.circular(kDefault / 2)),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, .3),
                          color: Colors.grey.withOpacity(.13),
                          blurRadius: 8.0)
                    ]),
                child: Row(
                  children: [
                    ///circle
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CustomPaint(
                        painter: Circle4Point(
                            gap: 1,
                            thickness: 6,
                            bottomLeftColor: Colors.deepOrange,
                            bottomRightColor: Colors.blue,
                            topLeftColor: Colors.grey.withOpacity(.34),
                            topRightColor: Colors.redAccent),
                        child: const Center(
                          child: Text("54%"),
                        ),
                      ),
                    ),
                     Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: kDefault),
                          child: const Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Flutter Tutorial Todo App"),
                              Text("Complete Progress.")
                            ],
                          ),
                        )
                    ),
                    const Icon(Icons.arrow_forward_ios,color: Colors.grey,)
                  ],
                ),
              );
  }

  Container buildAppBar(BuildContext context, Size size) {
    return Container(
      padding: EdgeInsets.only(
          left: kDefault,
          right: kDefault,
          top: MediaQuery.of(context).padding.top * 1.1,
          bottom: kDefault),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(kDefault * 2)),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, .3),
                color: Colors.black.withOpacity(.23),
                blurRadius: 12.0)
          ]),
      child: Column(
        children: [
          ///title name and icon
          Padding(
            padding: const EdgeInsets.only(bottom: kDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Task Manager App 2023",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Icon(
                  Icons.date_range,
                  color: Colors.blueAccent,
                )
              ],
            ),
          ),

          ///date card
          SizedBox(
            height: size.height * .11,
            width: size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dateList.length,
              itemBuilder: (context, index) {
                return DateCard(
                  index: index,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
