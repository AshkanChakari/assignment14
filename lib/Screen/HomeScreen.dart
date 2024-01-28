import 'package:assignment14/Screen/drawerNavigation.dart';
import 'package:assignment14/Screen/todoScreen.dart';
import 'package:assignment14/model/todo.dart';
import 'package:assignment14/services/todoService.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomeScreen(),
//   ));
// }

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoService? _todoService;

  List<Todo> _todoList = [];

  @override
  initState() {
    super.initState();
    getAllTodos();
  }

  getAllTodos() async {
    _todoService = TodoService();
    _todoList = [];

    var todos = await _todoService?.readTodos();

    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.id = todo["id"];
        model.title = todo["title"];
        model.description = todo["description"];
        model.category = todo["category"];
        model.todoDate = todo["todoDate"];
        model.isFinished = todo["isFinished"];


        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1A1717),
        title: Text(
          "ToDoList",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: DrawerNavigation(),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(top: 8.0 , left: 8.0 , right: 8.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_todoList[index].title ?? "No Title"),
                  ],
                ),
                subtitle: Text(_todoList[index].category ?? "No Category"),
                trailing: Text(_todoList[index].todoDate ?? "No Date"),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => todoScreen()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}