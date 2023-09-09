import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tutorial/screen/work_shop2/model/todo.dart';
import 'package:tutorial/screen/work_shop2/model/todo_model.dart';

class WorkShop2 extends StatefulWidget {
  const WorkShop2({super.key});

  @override
  State<WorkShop2> createState() => _WorkShop2State();
}

class _WorkShop2State extends State<WorkShop2> {
  TodoModel? todo;
  List<TodoModel>? todoList;
  int id = 1;

  void fetchData() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      todo = TodoModel.fromJson(jsonData);
      print(response.body);
    }
  }

  void removeTodo() async {
    final response = await http
        .delete(Uri.parse("https://jsonplaceholder.typicode.com/posts/$id"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      print(response.body);
    }
  }

  void fetchList() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        todoList =
            (jsonData as List).map((json) => TodoModel.fromJson(json)).toList();
      });
    }
  }

  void saveTodo() async {
    try {
      final response = await http.post(
          Uri.parse("https://jsonplaceholder.typicode.com/posts"),
          body: json.encode(Todo(id: 2, title: "Flutter", body: "Flutter content", userId: 120).toJson()));

      debugPrint("save todo");
      debugPrint(response.body);

      setState(() {
        id = json.decode(response.body)['id'];
        print(id);
      });
    }catch(ex){
      debugPrint("error");
      debugPrint(ex.toString());
      if(ex is HttpException){
        debugPrint(ex.message);
      }
    }
  }

  void updateTodo()async{
    final response = await http.put(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
        body: json.encode(Todo(id: 1, title: "Flutter", body: "Flutter content", userId: 120).toJson()));

    debugPrint("update todo");
    debugPrint(response.body);
  }

  @override
  void initState() {
    fetchData();
    fetchList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: ListView.builder(
              itemCount: todoList?.length ?? 0,
              itemBuilder: (context, index) =>
                  Text(todoList?[index].title ?? "null"),
            ),
          ),
          ElevatedButton(onPressed: saveTodo, child: const Text("Save")),
          ElevatedButton(onPressed: fetchData, child: const Text("Fetch")),
          ElevatedButton(onPressed: updateTodo, child: const Text("Update")),
          ElevatedButton(onPressed: removeTodo, child: const Text("Delete"))
        ],
      ),
    );
  }
}
