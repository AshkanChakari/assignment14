import 'package:assignment14/Screen/drawerNavigation.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1A1717),
        title: Text("ToDoList" , style: TextStyle(color: Colors.white),),
      ),
      drawer: Drawer(
        child: drawerNavigation(),
        backgroundColor: Color(0xfff0f0f0),
      ),
    );
  }
}
