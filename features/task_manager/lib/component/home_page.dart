import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/widget/circle4_point.dart';
import 'package:task_manager/component/widget/date_card.dart';
import 'package:task_manager/component/widget/task_card.dart';
import 'package:task_manager/data/model/date_data.dart';
import 'package:task_manager/data/model/task_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///appbar
        Container(
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
        ),

        Expanded(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),

              ///progress card
              Container(
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
              ),
              ///list task
              Expanded(
                  child: Center(
                    child: ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (context, index) {
                        return TaskCard(size: size,index:index);
                      },
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }
}