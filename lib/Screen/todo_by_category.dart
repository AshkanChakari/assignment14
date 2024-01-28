import 'package:assignment14/model/todo.dart';
import 'package:assignment14/services/todoService.dart';
import 'package:flutter/material.dart';

class TodosByCategory extends StatefulWidget {
final String category;
TodosByCategory({required this.category});

  @override
  State<TodosByCategory> createState() => _TodosByCategoryState();
}

class _TodosByCategoryState extends State<TodosByCategory> {
  List<Todo> _todoList = []; // Initialize as an empty list
  TodoService _todoService = TodoService();

  @override
  void initState(){
    super.initState();
    getTodosByCategories();
  }

  getTodosByCategories() async {
    var todos = await _todoService.readTodosByCategory(this.widget.category);
    todos.forEach((todo){
      setState(() {
        var model = Todo();
        model.title = todo["title"];
        model.description = todo["description"];
        model.todoDate = todo["todoDate"];

        _todoList.add(model); // Add the Todo object to the list
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.category),
      ),

    );
  }
}