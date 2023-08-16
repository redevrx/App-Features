import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController mController;

  @override
  void initState() {
    mController = PageController(viewportFraction: .8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          /**
           * custom appbar
           */
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /**
                  * icon and title
                  */
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text("Search Location")
                  ],
                ),

                /**
                  * icon notification
                  */
                Card(
                  elevation: 12,
                  shadowColor: Colors.grey.withOpacity(.23),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(Icons.notification_add),
                  ),
                )
              ],
            ),
          ),

          /**
           * search box
           */
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                /**
                 * search and icon
                 */
                const Icon(Icons.search),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Search here"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: const Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          /**
           * view pager content
           * pageView -> 1 ... 10
           * screen display item ->  3
           */
          SizedBox(
            height: size.height * 20 / 100,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: mController,
              itemCount: Colors.primaries.length,
              itemBuilder: (_, int index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      color: Colors.primaries[index % Colors.primaries.length],
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, .5),
                            color: Colors
                                .primaries[index % Colors.primaries.length]
                                .withOpacity(.4),
                            blurRadius: 10.0,
                        )
                      ]),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "30% off",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            "Food",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                          ),

                          const Spacer(),

                          ///button
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0))),
                            child: Text(
                              "Get Now",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Colors.primaries[
                                          index % Colors.primaries.length],
                                      fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),

                      ///
                      AspectRatio(
                        aspectRatio: 4/3,
                        child: Image.network(
                          'https://static.vecteezy.com/system/resources/previews/019/607/567/original/fast-food-vector-clipart-design-graphic-clipart-design-free-png.png',
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: size.height * 5 / 100,),
          ///categorise
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Categories",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),),
                Text("See All",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),)
              ],
            ),
          ),
          SizedBox(height: size.height * 2 / 100,),
          ///cate group
          SizedBox(
            height: size.height * 10 / 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Image.network('https://static.vecteezy.com/system/resources/thumbnails/001/200/294/small/house.png',
                        width: 60.0,
                        height: 60.0,
                      ),
                      const Text("Home")
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: size.height * 4 / 100,),
          /**
           * title text
           */
        Padding(
          padding: const EdgeInsets.only(left: 16.0,bottom: 16.0),
          child: Row(
            children: [
              Text("Nearby",style: Theme.of(context).textTheme.titleMedium,),
              const SizedBox(width: 16.0,),
              Container(
                padding: const EdgeInsets.all(2.0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle
                ),
                child: const Icon(Icons.arrow_forward,color: Colors.white,size: 12.0),
              )
            ],
          ),
        ),
          /**
           * list image
           */
          SizedBox(
            height: size.height * 24 / 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ///background content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            'https://images.pexels.com/photos/3278215/pexels-photo-3278215.jpeg?cs=srgb&dl=pexels-oleksandr-canary-islands-3278215.jpg&fm=jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                     left: size.width * 10 / 100,
                      bottom: size.width * 8 / 100,
                      child: Column(
                        children: [
                          Text("Home",
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          Text("Thai",style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(color: Colors.white.withOpacity(.7),fontWeight: FontWeight.bold))
                        ],
                      ),
                    )
                    ///
                  ],
                );
              },
            ),
          ),

          ///
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 6.0),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8.0),
            topRight: Radius.circular(8.0)
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -.6),
              color: Colors.grey.withOpacity(.23),
              blurRadius: 12.0
            )
          ]
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(Icons.home_max),
                Text("Home")
              ],
            ),
            Column(
              children: [
                Icon(Icons.favorite),
                Text("Favorite")
              ],
            ),
            Column(
              children: [
                Icon(Icons.person),
                Text("Person")
              ],
            ),
            Column(
              children: [
                Icon(Icons.settings),
                Text("Setting")
              ],
            )
          ],
        ),
      ),
    );
  }
}
