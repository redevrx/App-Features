import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/model/date_data.dart';

class DateCard extends StatelessWidget {
  const DateCard({
    super.key, required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault / 2),
          margin: const EdgeInsets.symmetric(horizontal: kDefault / 4,),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kDefault),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(.3,0),
                    color: Colors.grey.withOpacity(.2),
                    blurRadius: 10.0
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(dateList[index].title),
              index == 2 ?
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: kDefault / 2),
                    padding: const EdgeInsets.all(kDefault / 4),
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        shape: BoxShape.circle
                    ),
                    child: Text(dateList[index].date),
                  ),
                ],
              ) : Padding(
                padding: const EdgeInsets.only(top: kDefault / 2),
                child: Text(dateList[index].date),
              )
            ],
          ),
        ),
        index == 2 ?Positioned(
          top: 0,
          right: kDefault * 1.8,
          child: Container(
            width: kDefault / 1.1,
            height: kDefault / 6,
            decoration: const BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 6.0),
                    blurRadius: 12.0,
                    color: Colors.blueAccent,
                    spreadRadius: 1,
                  )
                ]
            ),
          ),
        ) :const SizedBox.shrink()
      ],
    );
  }
}