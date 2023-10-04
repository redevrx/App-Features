import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core/constants/divider.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/data/extension/size_response.dart';
import 'package:video_player/video_player.dart';

import '../../component/animation/animation_rotate.dart';

class Player {
  final VideoPlayerController controller;
  bool isVertical;

  Player({required this.controller, required this.isVertical});
}

class ReelScreen extends StatefulWidget {
  const ReelScreen({super.key});

  @override
  State<ReelScreen> createState() => _ReelScreenState();
}

class _ReelScreenState extends State<ReelScreen> {
  ///
  Map<int, Player?> mapController = Map.of({});
  int currentFocus = 0;

  @override
  void initState() {
    final controller = VideoPlayerController.networkUrl(Uri.parse(urls[0]));
    mapController[0] = Player(controller: controller, isVertical: false);
    controller.initialize().then((_) {
      mapController[0]?.controller.play();
    });

    mapController[1] = Player(
        controller: VideoPlayerController.networkUrl(Uri.parse(urls[1])),
        isVertical: false);
    mapController[1]?.controller.initialize().then((_) => null);
    super.initState();
  }

  ///preload video
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ///video widget
        PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (i) async {
            ///preload-video
            if (i > currentFocus) {
              ///Next video
              if (i - 1 >= 0) {
                mapController[i - 1]?.controller.pause();
              }
              if (i - 2 >= 0) {
                mapController[i - 2]?.controller.dispose();
              }

              mapController[i]?.controller.play();

              if (i + 1 < urls.length) {
                mapController[i + 1] = Player(
                    controller: VideoPlayerController.networkUrl(
                        Uri.parse(urls[i + 1])),
                    isVertical: false);
                await mapController[i + 1]?.controller.initialize();
                ;
              }
            } else {
              ///Previous
              mapController[i + 1]?.controller.pause();
              mapController[i + 2]?.controller.dispose();

              mapController[i]?.controller.play();

              if (i - 1 >= 0) {
                mapController[i - 1] = Player(
                    controller: VideoPlayerController.networkUrl(
                        Uri.parse(urls[i - 1])),
                    isVertical: false);
                await mapController[i - 1]?.controller.initialize();
              }
            }
            currentFocus = i;
          },
          itemCount: urls.length,
          itemBuilder: (_, index) => TiktokVideoPlayer(
              mController: mapController[index]!.controller,
              isVertical: mapController[index]!.isVertical,
              url: urls[index]),
        ),

        /// text title
        Align(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsets.only(top: size.toHeight(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Following",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      " | ",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey),
                    ),
                    Text(
                      "For you",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ],
                ))),

        ///info
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ///video info widget
              Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: kDefault, bottom: kDefault / 2),
                    height: size.toHeight(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///text user name
                        Text(
                          "@Snake",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: kDefault / 2,
                        ),

                        ///text detail post
                        Text(
                          "asijdioajsodkjoiasjoidjasoijdoaijsojasoijdoiasjodijsoa",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          height: kDefault / 2,
                        ),

                        ///song name
                        Row(
                          children: [
                            const Icon(
                              Icons.music_note_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              "Snake Rock @asopdkpaskp",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),

              ///social tag widget
              Expanded(
                  child: Container(
                margin: const EdgeInsets.only(bottom: kDefault),
                height: size.toHeight(45),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///profile post video
                    Stack(
                      children: [
                        const SizedBox(
                          height: 65,
                        ),
                        Container(
                          width: kCircle + 5,
                          height: kCircle + 5,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(kCircle)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kCircle),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://media.glamourmagazine.co.uk/photos/614de6bf3de8ee7a81e65933/1:1/w_1920,h_1920,c_limit/PROFILING_240921_GettyImages-1019899896_SQ.jpg',
                            ),
                          ),
                        ),

                        ///add circle
                        Positioned(
                          bottom: kDefault / 6,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(kDefault / 20),
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    buildSocialItemWidget(context,
                        icon: Icons.favorite, text: "1.3M"),
                    buildSocialItemWidget(context,
                        icon: Icons.comment_sharp, text: "2.3M"),
                    buildSocialItemWidget(context,
                        icon: Icons.share, text: "1.3M"),

                    ///animation rotate
                    TiktokAnimationRotate(
                        widget: ClipRRect(
                      borderRadius: BorderRadius.circular(kCircle),
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://haulixdaily.com/wp-content/uploads/2018/08/tumblr_inline_pe4i0bR0o21s24py6_540.png',
                        width: kCircle,
                        height: kCircle,
                        fit: BoxFit.cover,
                      ),
                    )),
                  ],
                ),
              ))
            ],
          ),
        )
      ],
    );
  }

  Column buildSocialItemWidget(BuildContext context,
      {required IconData icon, required String text}) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: kCircle,
        ),
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.white),
        )
      ],
    );
  }
}

class TiktokVideoPlayer extends StatefulWidget {
  const TiktokVideoPlayer(
      {super.key,
      required this.url,
      required this.mController,
      required this.isVertical});

  final String url;
  final VideoPlayerController mController;
  final bool isVertical;

  @override
  State<TiktokVideoPlayer> createState() => _TiktokVideoPlayerState();
}

class _TiktokVideoPlayerState extends State<TiktokVideoPlayer>
    with WidgetsBindingObserver {
  late Widget videoPlayer;
  bool videoVertical = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    videoPlayer = VideoPlayer(widget.mController);
    widget.mController.setLooping(true);

    videoVertical = widget.mController.value.size.height >
        widget.mController.value.size.width;
    super.initState();
  }


  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        widget.mController.pause();
        break;
      case AppLifecycleState.resumed:
        widget.mController.play();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return videoVertical
        ? videoPlayer
        : Center(
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: videoPlayer,
            ),
          );
  }
}

final urls = [
  'https://player.vimeo.com/external/447226472.sd.mp4?s=64fc9c7113b605e6179e26d9fc0550972079f665&profile_id=164&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/598353330.sd.mp4?s=c4f03a5c139bae9deba8aa22d8f09d0f265d7c9e&profile_id=164&oauth2_token_id=57447761',
  'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'https://player.vimeo.com/external/463902394.sd.mp4?s=e51f3979e6629a9309d6299f46e94957bd5a647d&profile_id=164&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/479267619.sd.mp4?s=492573ed779abde3ed7cbd2b62637a90da57e35f&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/427711576.hd.mp4?s=c2f19e5f0d59ef5fc014281f3a953e0cd333e4b2&profile_id=174&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/427709260.hd.mp4?s=78554dd91d719fea13a8e63da76a0791acd9267c&profile_id=174&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/450811642.sd.mp4?s=1754b26b060206d3c1e7ff8e761c3b7970ffef34&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/456094264.sd.mp4?s=13074aaa79fd9d083a99a7556b7e0fe3adcb1a1d&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/external/456094160.sd.mp4?s=9ef8b9818f3dfde399c37922954a4604f0986569&profile_id=165&oauth2_token_id=57447761',
];
