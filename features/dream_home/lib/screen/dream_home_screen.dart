import 'package:dream_home/data/model/item_data.dart';
import 'package:dream_home/screen/home_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:core/core/constants/divider.dart';

///thanks
class DreamHomeScreen extends StatelessWidget {
  const DreamHomeScreen({super.key});

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
            titleCard(context, size),

            ///recommended
            const Spacer(),
            buildRecommended(context),
            Expanded(
              flex: 8,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: kDefault),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ItemCard(size: size, index: index);
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
            const Icon(Icons.save_as),
            const Icon(Icons.mark_chat_read),
            const Icon(Icons.person)
          ],
        ),
      ),
    );
  }

  Row buildRecommended(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Text("See All")
            ],
          );
  }

  Stack titleCard(BuildContext context, Size size) {
    return Stack(
            alignment: Alignment.centerLeft,
            children: [
              Row(
                children: [
                  Text("Find Your\nDream Home",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                        fontSize: 42,
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
          );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
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

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.size,
    required this.index,
  });

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => HomeDetailScreen(item: items[index],index: index,),
          transitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => child,
        ));
      },
      child: Stack(
        children: [
          Hero(
            tag: items[index].url,
            child: Container(
            width:  size.width * .7,
            height: size.height * .4,
            padding: const EdgeInsets.all(kDefault),
            margin:
            const EdgeInsets.symmetric(horizontal: kDefault),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kDefault),
                boxShadow: [kShadow],
                image:  DecorationImage(
                    image: NetworkImage(
                        items[index].url),
                    fit: BoxFit.cover)),
          ),),

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
              child:  Column(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Text(items[index].ratting)
                ],
              ),
            )
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
               SingleChildScrollView(
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       items[index].price,
                       style: Theme.of(context)
                           .textTheme
                           .titleLarge
                           ?.copyWith(
                           color: Colors.white,
                           fontWeight: FontWeight.bold),
                     ),
                     Text(
                       items[index].per,
                       style: Theme.of(context)
                           .textTheme
                           .titleSmall
                           ?.copyWith(
                           color: Colors.white,
                           fontWeight: FontWeight.bold),
                     )
                   ],
                 ),
               ),
                Hero(
                    tag: '${items[index].hashCode}',
                    child: ElevatedButton(
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
                ))
              ],
            ),
          ),
          ///home info
          Positioned.fill(
            top: size.height * .26,
            right: kDefault * 2,
            left: kDefault * 2,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(items[index].name,style: Theme.of(context)
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
                      Text(items[index].location,style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

final kShadow = BoxShadow(
    offset: const Offset(.5, .5),
    color: Colors.grey.withOpacity(.23),
    blurRadius: 12.0);
