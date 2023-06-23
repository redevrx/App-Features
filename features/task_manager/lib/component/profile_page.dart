import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/component/widget/circle_indicator.dart';
import 'package:task_manager/data/model/task_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top * 1.2,
            ),

            ///profile progress
            TaskProfileCard(
                url:
                    'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
                name: 'Naked Snake',
                thickness: 8,
                task: taskList[0]),
            const Spacer(),

            ///other profile title
            Text("Your team task",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400),),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: kDefault * 2,
                    ),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        TaskProfileCard(
                            width: 70,
                            height: 70,
                            url:
                            'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
                            name: 'Naked Snake',
                            task: taskList[0]),
                        TaskProfileCard(
                            width: 70,
                            height: 70,
                            url:
                            'https://metro.co.uk/wp-content/uploads/2016/07/ad_212876871.jpg?quality=90&strip=all&zoom=1&resize=480%2C345',
                            name: 'O Snake',
                            task: taskList[1]),

                        TaskProfileCard(
                            width: 70,
                            height: 70,
                            url:
                            'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
                            name: 'Naked Snake',
                            task: taskList[0]),
                      ],
                    ),
                    const SizedBox(height: kDefault * 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskProfileCard(
                            width: 70,
                            height: 70,
                            url:
                            'https://howtodrawforkids.com/wp-content/uploads/2017/03/how-to-draw-a-face-step-by-step.jpg',
                            name: 'New Snake',
                            task: taskList[1]),
                        TaskProfileCard(
                            width: 70,
                            height: 70,
                            url:
                            'https://easydrawingguides.com/wp-content/uploads/2017/08/how-to-draw-a-simple-face-featured-image-1200.png',
                            name: 'Nu Snake',
                            task: taskList[3]),
                        TaskProfileCard(
                            width: 70,
                            height: 70,
                            url:
                            'https://howtodrawforkids.com/wp-content/uploads/2017/03/how-to-draw-a-face-step-by-step.jpg',
                            name: 'New Snake',
                            task: taskList[1]),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskProfileCard extends StatelessWidget {
  const TaskProfileCard({
    super.key,
    this.width = 150,
    this.height = 150,
    required this.url,
    this.progress = 220.0,
    required this.name,
    required this.task,
    this.thickness = 6
  });

  final double width;
  final double height;
  final String url;
  final double progress;
  final String name;
  final TaskData task;
  final double thickness;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: width,
          height: height,
          child: CustomPaint(
            painter: CircleIndicator(
                mColor: task.progressColor, thickness: thickness, progress: progress),
            child: Container(
              margin: const EdgeInsets.all(kDefault / 8),
              padding: const EdgeInsets.all(kDefault / 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(width - 50),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: width - 50,
                  height: height - 50,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: kDefault,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(
              width: kDefault,
            ),
            thickness != 8 ? const SizedBox.shrink() : const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
        const SizedBox(
          height: kDefault / 2,
        ),
       thickness == 8 ? Text(task.title,overflow: TextOverflow.clip,)
         : const SizedBox.shrink(),
        Text(
          task.progressText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
