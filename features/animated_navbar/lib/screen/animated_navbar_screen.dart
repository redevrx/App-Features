import 'package:animated_navbar/animation_nav.dart';
import 'package:animated_navbar/nav_controller.dart';
import 'package:flutter/material.dart';

class AnimatedNavbarScreen extends StatefulWidget {
  const AnimatedNavbarScreen({super.key});

  @override
  State<AnimatedNavbarScreen> createState() => _AnimatedNavbarScreenState();
}

class _AnimatedNavbarScreenState extends State<AnimatedNavbarScreen> {
  final _navController = NavController();

  @override
  void dispose() {
   _navController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AnimationNav(
        color: Colors.primaries[3 % Colors.primaries.length],
          maxHeight: size.height * .5,
          menuWidget: GestureDetector(
            onTap: (){
              _navController.forward();
            },
            child: buildContainerMin(),
          ),
          expendedWidget: GestureDetector(
            onTap: (){
            },
            child: buildContainerMax(),
          ),
          navController: _navController,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: Colors.primaries.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(16.0),
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.primaries[index % Colors.primaries.length],
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                    );
                  },
                ),
              )
            ],
          ),
      ),
    );
  }

  Widget buildContainerMax() {
    return  SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(onPressed: (){}, child: const Text('Open sheet')),
          ElevatedButton(onPressed: (){}, child: const Text('Open sheet')),
          ElevatedButton(onPressed: (){}, child: const Text('Open sheet')),
        ],
      ),
    );
  }


  Row buildContainerMin() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.home_max),
        Icon(Icons.people_alt_outlined),
        Icon(Icons.settings)
      ],
    );
  }
}
