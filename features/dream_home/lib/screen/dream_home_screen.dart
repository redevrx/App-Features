import 'package:flutter/material.dart';
import 'package:core/core/constants/divider.dart';

class DreamHomeScreen extends StatefulWidget {
  const DreamHomeScreen({super.key});

  @override
  State<DreamHomeScreen> createState() => _DreamHomeScreenState();
}

class _DreamHomeScreenState extends State<DreamHomeScreen> {

  late ScrollController _controller;
  double width = 0;
  double height = 0;

  @override
  void initState() {
   _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefault),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),

            ///title
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  children: [
                    Text("Find Your\nDream Home",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                        textAlign: TextAlign.start),
                  ],
                ),

                ///text search
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: kDefault / 4),
                    alignment: Alignment.center,
                    width: size.width * .4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kDefault),
                        color: Colors.white,
                        boxShadow: [kShadow]),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.close),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search",
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                  ),
                )
              ],
            ),

            ///recommended
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recommended",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text("See All")
              ],
            ),
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: kDefault),
                child: ListView.builder(
                  controller: _controller,
                  itemExtent: 330,
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 750),
                          width:  size.width * .7,
                          height: size.height * .4,
                          padding: const EdgeInsets.all(kDefault),
                          margin:
                              const EdgeInsets.symmetric(horizontal: kDefault),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(kDefault),
                              boxShadow: [kShadow],
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.grollohomes.com.au/wp-content/uploads/2020/05/Grollo-Belmore-140.jpg'),
                                  fit: BoxFit.cover)),
                        ),

                        ///ratting
                        Positioned(
                          right: kDefault * 1.2,
                          top: kDefault,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: kDefault, vertical: kDefault / 2),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.83),
                                borderRadius: BorderRadius.circular(kDefault)),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellowAccent,
                                ),
                                Text('9.0')
                              ],
                            ),
                          ),
                        ),

                        ///price
                        Positioned.fill(
                          top: size.height * .3,
                          left: kDefault * 2,
                          right: kDefault * 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "\$1999",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Per Mouth",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    elevation: kDefault / 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(kDefault))),
                                child: const Padding(
                                  padding: EdgeInsets.all(kDefault),
                                  child: Text(
                                    'AR View',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        ///home info
                        Positioned.fill(
                          top: size.height * .26,
                          right: kDefault * 2,
                          left: kDefault * 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Naked Snake",style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on_outlined,color: Colors.white,),
                                  Text("Thai",style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefault,vertical: kDefault * 2),
        padding: const EdgeInsets.symmetric(horizontal: kDefault * 1.5,vertical: kDefault / 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefault),
          boxShadow: [kShadow]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kDefault)
                  )
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefault / 1.2),
                  child: Icon(Icons.home_outlined),
                )),
            Icon(Icons.save_as),
            Icon(Icons.mark_chat_read),
            Icon(Icons.person)
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(kDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///icon profile
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(kDefault),
                      child: SizedBox(
                        width: kCircle,
                        height: kCircle,
                        child: Image.network(
                            'https://i0.wp.com/post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/03/GettyImages-1092658864_hero-1024x575.jpg?w=1155&h=1528',
                            fit: BoxFit.cover),
                      ),
                    ),

                    ///title
                    const Padding(
                        padding: EdgeInsets.only(left: kDefault / 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("data"),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined),
                                Text("Thai")
                              ],
                            )
                          ],
                        ))
                  ],
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kDefault),
                      boxShadow: [kShadow]),
                  child: const Padding(
                    padding: EdgeInsets.all(kDefault / 1.1),
                    child: Icon(Icons.menu),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

final kShadow = BoxShadow(
    offset: const Offset(.5, .5),
    color: Colors.grey.withOpacity(.23),
    blurRadius: 12.0);
