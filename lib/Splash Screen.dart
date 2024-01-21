import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xff1A1717),
      body:
      Image(image:
      AssetImage("images/Todo.png"
      ),
      width: 100,
      ) ,
    );
  }
}