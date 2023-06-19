class RoomData {
  final int? id;
  final String? created;
  final String? roomId;
  final String? senderId;
  final String? receiverId;
  final String? receiverImgUrl;
  final String? receiverName;
  final String? lastMessage;
  final String? sendTime;
  final String? type;

  RoomData(
      {this.id,
      this.created,
      this.roomId,
      this.senderId,
      this.receiverId,
      this.receiverImgUrl,
      this.receiverName,
      this.lastMessage,
      this.sendTime,
      this.type});

  factory RoomData.fromJson(Map<String,dynamic> json) => RoomData(
    id: json['id'],
    created: json['created_at'],
    roomId: json['roomId'],
    senderId: json['senderId'],
    receiverId: json['receiverId'],
    receiverImgUrl: json['receiverImgUrl'],
    receiverName: json['receiverName'],
    lastMessage: json['lastMessage'],
    sendTime: json['timeSend'],
    type: json['type']
  );
}
