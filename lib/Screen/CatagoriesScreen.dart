import 'package:flutter/material.dart';

class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen({super.key});

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  _showFromDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Cancel",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  print("Category:${_categoryNameController.text}");
                  print("Category:${_categoryDescriptionController.text}");
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
            ],
            title: Text("Categories Form"),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(
                      hintText: "Write a category",
                      labelText: "Catagory",
                    ),
                  ),
                  TextField(
                    controller: _categoryDescriptionController,
                    decoration: InputDecoration(
                      hintText: "Write a description",
                      labelText: "Description",
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1A1717),
        title: Text("Categories", style: TextStyle(color: Colors.white)),
      ),
      body: Center(child: Text("Welcome")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showFromDialog(context);
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.black),
    );
  }
}
