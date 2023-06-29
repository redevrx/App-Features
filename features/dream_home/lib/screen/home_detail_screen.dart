import 'package:core/core/constants/divider.dart';
import 'package:core/core/widgets/animations/translate_animation.dart';
import 'package:dream_home/data/model/item_data.dart';
import 'package:dream_home/screen/dream_home_screen.dart';
import 'package:flutter/material.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({super.key, required this.item, required this.index});

  final ItemData item;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(kDefault),
        child: Column(
          children: [
            buildImgCard(size),
            const SizedBox(height: kDefault,),
            buildTitleName(context),
            const SizedBox(height: kDefault * 2,),
            ///
            Flexible(
              child: Text(item.description,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),),
            ),
            const SizedBox(height: kDefault * 2,),
            ///price and book now
          buildPriceBox(context)
          ],
        ),
      ),
    );
  }

  TranslateAnimation buildPriceBox(BuildContext context) {
    return TranslateAnimation(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.price,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black,fontWeight: FontWeight.bold),),
                  const Text("Per Month")
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: kDefault / 3,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(kDefault))),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefault * 2,vertical: kDefault),
                  child: Text(
                    'Book Now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        );
  }

  Column buildTitleName(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name,style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 32,color: Colors.black,fontWeight: FontWeight.bold),),
             Row(
               children: [
                 const Icon(Icons.location_on_outlined),
                 Text(item.location)
               ],
             ),
              const SizedBox(height: kDefault * 2,),
              ///contact card
             TranslateAnimation(
                 type: 1,
                 child:  DecoratedBox(
               decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.circular(kDefault),
                   boxShadow: [kShadow]
               ),
               child: Padding(
                 padding: const EdgeInsets.all(kDefault),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           children: [
                             ClipRRect(
                               borderRadius: BorderRadius.circular(kDefault),
                               child: Image.network('https://www.faceapp.com/static/img/content/compare/beard-example-before@3x.jpg',
                                 height: kCircle,
                                 width: kCircle,
                                 fit: BoxFit.cover,),
                             ),
                             const Padding(
                               padding: EdgeInsets.only(left: kDefault / 2),
                               child:  Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text("Joseph Robinson"),
                                   Text("Thailand")
                                 ],
                               ),
                             )
                           ],
                         ),
                         DecoratedBox(
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius:BorderRadius.circular(kDefault),
                               boxShadow: [kShadow]
                           ),
                           child: InkWell(
                             onTap: (){},
                             child: const Padding(
                               padding: EdgeInsets.all(kDefault),
                               child: Icon(Icons.call),
                             ),
                           ),
                         )
                       ],
                     ),
                     const SizedBox(height: kDefault,),
                     /// rooms
                     DecoratedBox(
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(kDefault),
                           boxShadow: [kShadow]
                       ),
                       child: const Padding(
                         padding: EdgeInsets.symmetric(horizontal: kDefault ,vertical: kDefault),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("04 Bedrooms"),
                             Text("02 Bedrooms"),
                             Text("01 Bedrooms")
                           ],
                         ),
                       ),
                     )
                   ],
                 ),
               ),
             ),)
            ],
          );
  }

  Hero buildImgCard(Size size) {
    return Hero(
            tag: item.url,
            child: Stack(
              children: [
                Container(
                  width:  size.width,
                  height: size.height * .3,
                  padding: const EdgeInsets.all(kDefault),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(kDefault),
                      boxShadow: [kShadow],
                      image:  DecorationImage(
                          image: NetworkImage(
                              item.url),
                          fit: BoxFit.cover)),
                ),
                ///ratting
                Positioned(
                  right: kDefault * 2,
                    top: kDefault,
                    child: TranslateAnimation(
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
                        Material(
                          color: Colors.transparent,
                          child: Text(items[index].ratting),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),);
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
       elevation: 0,
       bottom: PreferredSize(
         preferredSize: const Size.fromHeight(kToolbarHeight / 1.5),
         child: Padding(
           padding: const EdgeInsets.only(left: kDefault,right: kDefault,bottom: kDefault * 1.6),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Ink(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(kDefault),
                   color: Colors.white,
                   boxShadow: [kShadow],
                 ),
                 child: InkWell(
                   onTap: (){
                     Navigator.pop(context);
                   },
                   child: const Padding(
                     padding: EdgeInsets.all(kDefault),
                     child: Icon(Icons.arrow_back_sharp),
                   ),
                 )
               ),
               Hero(
                   tag: '${item.hashCode}',
                   child: ElevatedButton(
                     onPressed: () {},
                     style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.white,
                         elevation: kDefault / 4,
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
       ),
    );
  }
}
