import 'package:assignment14/Screen/CatagoriesScreen.dart';
import 'package:assignment14/Screen/HomeScreen.dart';
import 'package:assignment14/Screen/todo_by_category.dart';
import 'package:assignment14/services/CategoriesService.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = [];

  CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    var categories = await _categoryService.readCategories();

    setState(() {
      _categoryList = categories.map<Widget>((category) {
        return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TodosByCategory(category: null!))),
          child: ListTile(
            title: Text(category["name"]),
          ),
        );
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/image.jpeg"),
              ),
              accountName: Text("Foo Baz"),
              accountEmail: Text("Foo.Baz@gmail.com"),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
            ListTile(
              title: Text("Categories"),
              leading: Icon(Icons.view_list),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CatagoriesScreen()),
                );
              },
            ),
            Divider(),
            Column(
              children: _categoryList,
            )
          ],
        ),
      ),
    );
  }
}