import 'package:flutter/material.dart';

import '../constants/divider.dart';
import '../temp.dart';


class MangaCard extends StatelessWidget {
  const MangaCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(
                vertical: kDefault, horizontal: kDefault),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kDefault / 1.2),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(1, 8),
                    color: Colors.blue.withOpacity(.12),
                    blurRadius: 8)
              ],
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDefault / 1.2),
                child: Image.network(
                  mMangas[index],
                  fit: BoxFit.cover,
                  cacheHeight: 576,
                  cacheWidth: 720,
                ),
              ),
            )),

        /// chapter
        Positioned(
          top: kDefault * 2,
          right: kDefault * 3,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefault / 1.2, vertical: kDefault / 2.5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kDefault)),
            child: const Text("Chapter 156"),
          ),
        ),

        ///type manga
        Positioned(
          bottom: kDefault * 2,
          left: kDefault * 2,
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: kDefault / 2, vertical: kDefault / 2.5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(kDefault)),
            child: Row(
              children: [
                Image.network(
                  kIconChines,
                  fit: BoxFit.cover,
                  cacheHeight: kDefault.toInt(),
                  cacheWidth: kDefault.toInt(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefault / 2),
                  child: Text("Manhua"),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
