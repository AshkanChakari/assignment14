import 'package:flutter/material.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({super.key});

  @override
  State<todoScreen> createState() => _todoScreenState();
}

class _todoScreenState extends State<todoScreen> {
  var todoTitleController = TextEditingController();

  var todoDescriptionController = TextEditingController();

  var todoDateController = TextEditingController();

  var _categories;

  var _selectedValue;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //This is belong to Title
            TextField(
              controller: todoTitleController ,
              decoration: InputDecoration(
                labelText: "Title",
                hintText: "Write Todo Title"
              ),
            ),
            //This is belong to Description
            TextField(
              controller: todoDescriptionController ,
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write Todo Description"
              ),
            ),
            //This is belong to Date
            TextField(
              controller: todoDateController ,
              decoration: InputDecoration(
                labelText: "Date",
                hintText: "Pick a Date",
                prefixIcon: InkWell(
                  onTap: (){},
                  child: Icon(Icons.calendar_today),
                )
              ),
            ),

            SizedBox(
              height: 13,
            ),

            DropdownButtonFormField(
                value: _selectedValue,
                items: _categories,
                hint: Text("Category"),
                onChanged: (value){
                  setState(() {
                    _selectedValue = value;
                  });
                },
                ),

            SizedBox(
              height: 30,
            ),

            ElevatedButton(
              onPressed: (){},
              child: Text("Save" , style: TextStyle(color: Colors.black),),
              style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(85, 40),),
              shape: MaterialStatePropertyAll(LinearBorder()),
                backgroundColor: MaterialStatePropertyAll(Colors.grey.shade300)
              ),
            )

          ],
        ),
      ),
    );
  }
}
