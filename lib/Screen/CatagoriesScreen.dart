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
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;
                var result = _categoryService.saveCategory(_category);
                print(result);
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
                    labelText: "Category",
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
      },
    );
  }

  _editFromDialog(BuildContext context) {
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
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;
                var result = _categoryService.saveCategory(_category);
                print(result);
              },
              child: Text(
                "Update",
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
          title: Text("Categories Form"),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () {},
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