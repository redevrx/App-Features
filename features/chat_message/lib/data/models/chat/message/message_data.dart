class MessageData {
  final int? id;
  final String? createdAt;
  final String? senderId;
  final String? receiverId;
  final String? message;
  final String? type;
  final String? roomId;

  MessageData(
      {this.id,
      this.createdAt,
      this.senderId,
      this.receiverId,
      this.message,
      this.type,
      this.roomId});

  factory MessageData.fromJson(Map<String,dynamic> json) => MessageData(
    id: json['id'],
    createdAt: json['created_at'],
    senderId: json['senderId'],
    receiverId: json['receiverId'],
    message: json['message'],
    type: json['type'],
    roomId: json['roomId']
  );
}
