import 'package:core/core/constants/divider.dart';
import 'package:core/core/temp.dart';
import 'package:core/core/themes/theme_change.dart';
import 'package:core/core/widgets/animations/translate_animation.dart';
import 'package:core/core/widgets/manga_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        /// title bar
        _titleBar(context),

        ///
        _mangaList(context)
      ],
    ));
  }

  Widget _mangaList(BuildContext context) {
    return Expanded(
        flex: 5,
        child: Column(
          children: [
            ///horizontal menu
            Expanded(
              flex: 1,
              child: TranslateAnimation(
                type: 1,
                child: Wrap(
                  direction: Axis.horizontal,
                  children: List.generate(4, (index) {
                    int i = index + 1;
                    return i != 1
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: kDefault / 2, horizontal: kDefault),
                            child: Text(
                              "Manhua",
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: kDefault / 2,
                                horizontal: kDefault * 1.5),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0,5),
                                    color: Colors.red.withOpacity(.23),
                                    blurRadius: 38
                                  )
                                ],
                                borderRadius: BorderRadius.circular(kDefault)),
                            child: const Text(
                              "All",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          );
                  }),
                ),
              ),
            ),

            ///
            Expanded(
                flex: 9,
                child: TranslateAnimation(
                  child: ListView.builder(
                    cacheExtent: 4,
                    physics: const BouncingScrollPhysics(),
                    itemCount: mMangas.length,
                    itemBuilder: (context, index) => MangaCard(index: index),
                  ),
                ))
          ],
        ));
  }

  Widget _titleBar(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefault, vertical: kDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: kHeight / 1.3,
                  height: kHeight / 1.3,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(kCircle),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(kDefault / 10, kDefault / 4),
                          color: Colors.black.withOpacity(kOpacity),
                          blurRadius: kDefault / 4)
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(kCircle),
                        child: Image.network(
                          kUrlProfile,
                          fit: BoxFit.cover,
                          cacheWidth: 115,
                          cacheHeight: 115,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Good afternoon",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey)),
                    Text("Mira Suxi",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.black))
                  ],
                )
              ],
            ),

            ///menu
            GestureDetector(
              onTap: () =>
                  context.read<ThemeChange>().setTheme(ThemeData.light()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: kDefault / 2),
                  Container(
                      height: kCircle / 1.3,
                      width: kCircle / 1.3,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: kDefault - 14.5, color: Colors.grey),
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Image.network(
                              kUrlMenu,
                              fit: BoxFit.cover,
                              cacheHeight: (kDefault * 1.4).toInt(),
                              cacheWidth: (kDefault * 1.4).toInt(),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
