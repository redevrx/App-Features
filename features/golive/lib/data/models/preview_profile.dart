import 'package:flutter/material.dart';

class PreviewProfile {
  final String name;
  final String label;
  final String url;
  final bool isLiveNow;
  final Color color;

  PreviewProfile(
      {required this.name,
      required this.label,
      required this.url,
      this.isLiveNow = false,
      required this.color,});
}

final previewProfiles = [
  PreviewProfile(
    name: 'Snake',
    label: 'Live',
    url: 'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
    isLiveNow: true,
    color: Colors.blue
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
  color: Colors.blueAccent,
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
  color: Colors.indigoAccent,
    isLiveNow: true
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
    color: Colors.redAccent,
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
    color: Colors.pinkAccent,
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
    color: Colors.deepOrangeAccent,
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
    color: Colors.brown,
    isLiveNow: true
  ),
  PreviewProfile(
      name: 'Snake',
      label: 'Live',
      url:
          'https://cdn4.iconfinder.com/data/icons/author-emoticon/50/4-512.png',
    color: Colors.indigoAccent,),
];
