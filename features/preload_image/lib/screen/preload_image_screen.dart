import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:preload_image/preload_image.dart';

class PreloadImageScreen extends StatefulWidget {
  const PreloadImageScreen({super.key});

  @override
  State<PreloadImageScreen> createState() => _PreloadImageScreenState();
}

class _PreloadImageScreenState extends State<PreloadImageScreen> {
  void preloadImages() async {
    final cache = DefaultCacheManager();
    for (final url in imageList) {
      await cache.getSingleFile(url);
    }
  }

  Future<List<String>> mockLoadAPI() async {
    return Future.delayed(const Duration(seconds: 1), () {
      return imageList;
    });
  }

  ///image slow show
  @override
  void initState() {
    preloadImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Example Preload Image",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FutureBuilder<List<String>>(
            future: mockLoadAPI(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final items = snapshot.data;
                return Flexible(
                    child: ListView.builder(
                  itemCount: items!.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ClipRRect(
                        child: CustomCacheImage(
                          url: items[index],
                        ),
                      ),
                    ),
                  ),
                ));
              }

              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}

class CustomCacheImage extends StatelessWidget {
  const CustomCacheImage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: DefaultCacheManager().getSingleFile(url),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Image.file(
            snapshot.data!,
            fit: BoxFit.cover,
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
