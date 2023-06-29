import 'package:flutter/material.dart';

class RoomData {
  final String room;
  final Color color;

  RoomData({required this.room, required this.color});
}

final rooms = [
  RoomData(room: 'Room #123',
      color: Colors.white,
  ),
  RoomData(room: 'Room #8123',
    color: Colors.orange,
  ),
  RoomData(room: 'Room #421',
    color: Colors.indigoAccent,
  ),
  RoomData(room: 'Room #212',
    color: Colors.green,
  ),
  RoomData(room: 'Room #312',
    color: Colors.red,
  ),
];