class TodoModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  TodoModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory TodoModel.fromJson(Map<dynamic, dynamic> json) => TodoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body']);
}
