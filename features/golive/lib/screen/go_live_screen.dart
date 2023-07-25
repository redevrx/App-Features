import 'dart:ui';

import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:golive/data/models/chip_text.dart';
import 'package:golive/data/models/preview_profile.dart';

class GoLiveScreen extends StatelessWidget {
  const GoLiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              /**
               * title
               */
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).padding.top * 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kDefault),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "GoLive",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const ButtonIcon(icon: Icons.nightlight_outlined),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: kDefault / 2),
                          child: ButtonIcon(icon: Icons.notification_add),
                        ),
                        const ButtonIcon(
                          icon: Icons.search,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              /// preview profile
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height * .16,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: previewProfiles.length,
                    itemBuilder: (context, index) {
                      return PreviewProfileCard(
                        index: index,
                      );
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kDefault),
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Categories",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),),
                          Text("View All",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.red),)
                        ],
                      ),
                    ),
                    const SizedBox(height: kDefault,),
                    SizedBox(
                      height: size.height * .04,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: chipTextDataList.length,
                        itemBuilder: (context, index) {
                          return ChipTextCard(index: index,);
                        },
                      ),
                    )
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                    height: size.height * .6,
                    width: double.infinity,
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: .8,
                      ),
                      itemBuilder: (context, index) {
                        return LiveCard(size: size);
                      },
                    )
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child:  SizedBox(
              height: 80,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(kDefault / 2),
                    topRight: Radius.circular(kDefault / 2)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 10.0,sigmaX: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical:kDefault / 2,horizontal: kDefault * 2),
                    color: Colors.transparent,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.home,color: Colors.white,size: 30,),
                        Icon(Icons.people_outline_sharp,color: Colors.redAccent,size: 30,),
                        Icon(Icons.gamepad,color: Colors.white,size: 30,),
                        Icon(Icons.settings,color: Colors.white,size: 30,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LiveCard extends StatelessWidget {
  const LiveCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kDefault / 2),
                child: Image.network("https://pbblogassets.s3.amazonaws.com/uploads/2021/03/17162850/start-streaming.jpg",
                  width: size.width * .4,
                  height: size.height * .2,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: kDefault / 2,
                top: kDefault / 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kDefault),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0,sigmaY: 10.0),
                    child:  Container(
                      padding: const EdgeInsets.symmetric(horizontal: kDefault / 2,vertical: kDefault / 4),
                      child: const Row(
                        children: [
                          Icon(Icons.visibility_outlined,color: Colors.white,),
                          SizedBox(width: kDefault / 6,),
                          Text("12.2k",style: TextStyle(color: Colors.white),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: kDefault / 2,
                right: kDefault / 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: kDefault / 2,vertical: kDefault / 6),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(kDefault / 2)
                  ),
                  child: const Text("Live",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                ),
              ),
              const Positioned(
                bottom: kDefault / 2,
                left: kDefault,
                child:  Text("Naked Snake",
                  style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefault / 1.2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefault / 2),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png"),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Call Of Duty MW2",style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.bold)),
                    Text("Naked Snake",style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ChipTextCard extends StatelessWidget {
  const ChipTextCard({
    super.key, required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefault / 2),
      margin: const EdgeInsets.symmetric(horizontal: kDefault / 4),
      decoration: BoxDecoration(
          color: index == 2 ? Colors.indigoAccent : Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(kDefault)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(chipTextDataList[index].icon,color: Colors.red,),
          Text(chipTextDataList[index].title,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),)
        ],
      ),
    );
  }
}

class PreviewProfileCard extends StatelessWidget {
  const PreviewProfileCard({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefault / 4),
      child: Stack(
        children: [
          Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: previewProfiles[index].isLiveNow
                            ? Colors.red
                            : Colors.grey.withOpacity(.43),
                        width: 2)),
                child: Container(
                  margin: const EdgeInsets.all(kDefault / 4),
                  padding: const EdgeInsets.all(kDefault / 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: previewProfiles[index].color,
                  ),
                  child: Image.network(
                    previewProfiles[index].url,
                    fit: BoxFit.contain,
                    width: kHeight,
                    height: kHeight,
                  ),
                ),
              ),
              const SizedBox(
                height: kDefault / 3,
              ),
              Text(
                previewProfiles[index].name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.white),
              )
            ],
          ),
          previewProfiles[index].isLiveNow
              ? Positioned(
                  top: kDefault / 4,
                  left: kDefault * 2.2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefault / 3),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(kDefault)),
                    child: const Text(
                      "Live",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

class ButtonIcon extends StatelessWidget {
  const ButtonIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefault / 1.5),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.43), shape: BoxShape.circle),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
