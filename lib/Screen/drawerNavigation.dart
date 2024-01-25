import 'package:assignment14/Screen/CatagoriesScreen.dart';
import 'package:assignment14/Screen/HomeScreen.dart';
import 'package:assignment14/services/CategoriesService.dart';
import 'package:flutter/material.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = List<Widget>.empty();

  CategoryService _categoryService = CategoryService();

  @override
  initState(){
    super.initState();
    getAllCategories();
  }



  getAllCategories() async {
    var categories = await _categoryService.readCategories();

    categories.forEach((category) {
      setState(() {
        _categoryList.add(ListTile(title: Text(category["name"]),
        ));
      });
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
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
              ListTile(
              title: Text("Catagories"),
              leading: Icon(Icons.view_list),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CatagoriesScreen()));
              },
            ),
            Divider(),
            Column(
              children: _categoryList
            )
          ],
        ),
      ),
    );
  }
}