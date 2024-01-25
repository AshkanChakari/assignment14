import 'package:assignment14/model/todo.dart';
import 'package:assignment14/services/CategoriesService.dart';
import 'package:assignment14/services/todoService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class todoScreen extends StatefulWidget {
  const todoScreen({Key? key});

  @override
  State<todoScreen> createState() => _todoScreenState();
}

class _todoScreenState extends State<todoScreen> {
  var _todoTitleController = TextEditingController();

  var _todoDescriptionController = TextEditingController();

  var _todoDateController = TextEditingController();

  var _categories = <DropdownMenuItem<dynamic>>[];

  var _selectedValue;

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category["name"]),
          value: category["name"],
        ));
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  _selectedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if(_pickedDate != null){
      setState(() {
        _dateTime = _pickedDate;
        _todoDateController.text = DateFormat("yyyy-MM-dd").format(_pickedDate);
      });
    }
  }

  //This is for snackBar while user pressed the save button the snackBar show from btm emulator or mobile
  _showSuccessSnackBar(message) {
    var _snackBar = SnackBar(content: message);
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
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
              controller: _todoTitleController ,
              decoration: InputDecoration(
                labelText: "Title",
                hintText: "Write Todo Title"
              ),
            ),
            //This is belong to Description
            TextField(
              controller: _todoDescriptionController ,
              decoration: InputDecoration(
                labelText: "Description",
                hintText: "Write Todo Description"
              ),
            ),
            //This is belong to Date
            TextField(
              controller: _todoDateController ,
              decoration: InputDecoration(
                labelText: "Date",
                hintText: "Pick a Date",
                prefixIcon: InkWell(
                  onTap: (){
                    _selectedTodoDate(context);
                  },
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
              onPressed: () async {
                var todoObject = Todo();

                todoObject.title = _todoDateController.text;
                todoObject.description = _todoDateController.text;
                todoObject.isFinished = 0;
                todoObject.category = _selectedValue.toString();
                todoObject.todoDate = _todoDateController.text;

                var _todoService = TodoService();
                var result = await _todoService.saveTodo(todoObject);

                if(result > 0){
                  _showSuccessSnackBar(Text("created"));
                }

                print(result);
              },
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
