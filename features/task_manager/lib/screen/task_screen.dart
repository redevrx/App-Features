import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/home_page.dart';
import 'package:task_manager/component/profile_page.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomePage(size: size),
          ProfilePage(size:size)
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
      bottomNavigationBar: buildNavbar(),
    );
  }

  Container buildNavbar() {
    return Container(
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
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: (){
              setState(() {
                index = 0;
              });
            },
            child: Column(
              children: [
                Icon(Icons.home_filled,size: kCircle / 1.6,color: index == 0 ? Colors.blueAccent : null,),
                Text("Home",style: TextStyle(color: index == 0 ? Colors.blueAccent : null),)
              ],
            ),
          ),
        InkWell(
          onTap: (){
            setState(() {
              index = 1;
            });
          },
          child: Column(
            children: [
              Icon(Icons.auto_graph_sharp,size: kCircle / 1.6,color: index == 1 ? Colors.blueAccent : null,),
              Text("Profile",style: TextStyle(color: index == 1 ? Colors.blueAccent : null),)
            ],
          ),
        )
        ],
      ),
    );
  }
}
