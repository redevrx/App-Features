import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/widget/circle_indicator.dart';
import 'package:task_manager/data/model/task_data.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.size, required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 1,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: kDefault / 2,horizontal: kDefault * 1.2),
            padding: const EdgeInsets.all(kDefault),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kDefault),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0,.5),
                      color: Colors.grey.withOpacity(.23),
                      blurRadius: 12.0
                  )
                ]
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: kDefault / 2),
                  child: Icon(taskList[index].icon,color: taskList[index].progressColor,size: kCircle / 1.2,),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(taskList[index].title),
                      Text(taskList[index].subTitle)
                    ],
                  ),
                ),
                SizedBox(
                  width: kCircle,
                  height: kCircle,
                  child: CustomPaint(
                    painter: CircleIndicator(
                        thickness: 6,
                        mColor: taskList[index].progressColor,
                        progress: taskList[index].progress
                    ),
                    child: Center(
                      child: Text(taskList[index].progressText),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: kDefault),
                  child: Icon(Icons.arrow_forward_ios,color: Colors.grey,),
                )
              ],
            ),
          ),
          ///dot color
          Positioned(
            top: kDefault * 2.5,
            left: kDefault + 4,
            child: Container(
              width: 1.6,
              height: kDefault,
              decoration:  BoxDecoration(
                  color: taskList[index].dotColor,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(6.0, 0),
                      blurRadius: 12.0,
                      color: taskList[index].dotColor,
                      spreadRadius: 1.8,
                    )
                  ]
              ),
            ),
          ),
        ],
      ),);
  }
}