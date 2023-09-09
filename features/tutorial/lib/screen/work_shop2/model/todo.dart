/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

class Todo {
    Todo({
        required this.id,
        required this.title,
        required this.body,
        required this.userId,
    });

    int id;
    String title;
    String body;
    int userId;

    factory Todo.fromJson(Map<dynamic, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
    );

    Map<dynamic, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
    };
}
