import 'package:flutter/material.dart';
import 'package:assignment14/model/Category.dart';
import 'package:assignment14/services/CategoriesService.dart';

class CatagoriesScreen extends StatefulWidget {
  const CatagoriesScreen({Key? key}) : super(key: key);

  @override
  State<CatagoriesScreen> createState() => _CatagoriesScreenState();
}

class _CatagoriesScreenState extends State<CatagoriesScreen> {
  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  List<Category> _categoryList = [];

  var category;

  var _editCategoryNameController = TextEditingController();
  var _editCategoryDescriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  //I global the SnackBar
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();


  getAllCategories() async {
    _categoryList = [];
    var categories = await _categoryService.readCategories();
    categories.forEach((category) {
      setState(() {
        var categoryModel = Category();
        categoryModel.name = category["name"];
        categoryModel.description = category["description"];
        categoryModel.id = category["id"];
        _categoryList.add(categoryModel);
      });
    });
  }

  _editCategory(BuildContext context , categoryId) async {
    category = await _categoryService.readCategoriesById(categoryId);
    setState(() {
      _editCategoryNameController.text = category[0]["name"]??"No Name";
      _editCategoryDescriptionController.text = category[0]["description"]??"No Description";
    });
    _editFromDialog(context);
  }

  _showFromDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: [
            //Button Cancel
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),

            //Button Save
            MaterialButton(
              onPressed: () async {
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;

                var result = await _categoryService.saveCategory(_category);
                if(result > 0){
                  print(result);
                  Navigator.pop(context);
                  getAllCategories();
                }
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
                //This is belong to user add text to category place
                TextField(
                  controller: _categoryNameController,
                  decoration: InputDecoration(
                    hintText: "Write a category",
                    labelText: "Category",
                  ),
                ),

                //This is belong to user add text to description place
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
      },
    );
  }

  //this is update button, when user update the one list
  _editFromDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: [
            //Cancel button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),

            //Update button
            MaterialButton(
              onPressed: () async {
                _category.id = category[0]["id"];
                _category.name = _editCategoryNameController.text;
                _category.description = _editCategoryDescriptionController.text;

                var result = await _categoryService.updateCategory(_category);
                if(result > 0){
                  Navigator.pop(context);
                  getAllCategories();
                }
                _showSuccessSnackBar(Text("updated"));
              },
              child: Text(
                "Update",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
          title: Text("Edit Categories Form"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: _editCategoryNameController,
                  decoration: InputDecoration(
                    hintText: "Write a category",
                    labelText: "Category",
                  ),
                ),
                TextField(
                  controller: _editCategoryDescriptionController,
                  decoration: InputDecoration(
                    hintText: "Write a description",
                    labelText: "Description",
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  //this is delete button, when user delete the one list
  _deleteFromDialog(BuildContext context , categoryId) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (param) {
        return AlertDialog(
          actions: [

            //Cancel button
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),

            //Delete button
            MaterialButton(
              onPressed: () async {
                var result = await _categoryService.deleteCategory(categoryId);
                if(result > 0){
                  Navigator.pop(context);
                  getAllCategories();
                  _showSuccessSnackBar(Text("Deleted"));
                }
              },
              child: Text(
                "Delete",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
          title: Text("Are you sure you want to delete?" , style: TextStyle(fontSize: 19,),),
        );
      },
    );
  }

  //This is for snackBar while user pressed the update button the snackBar show from btm emulator or mobile
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
        title: Text("Categories", style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0 , left: 16.0 , right: 16.0),
            child: Card(
              elevation: 8.0,
              child: ListTile(
                leading: IconButton(onPressed: () {
                  _editCategory(context, _categoryList[index].id);
                }, icon: Icon(Icons.edit)),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_categoryList[index].name!),
                    IconButton(
                      onPressed: () {
                        _deleteFromDialog(context , _categoryList[index].id);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
                // subtitle: Text(_categoryList[index].description!),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFromDialog(context);
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