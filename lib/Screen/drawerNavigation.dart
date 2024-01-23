import 'package:flutter/material.dart';

class drawerNavigation extends StatefulWidget {
  const drawerNavigation({super.key});

  @override
  State<drawerNavigation> createState() => _drawerNavigationState();
}

class _drawerNavigationState extends State<drawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Fnature%2F&psig=AOvVaw2dmLV6vrKJPJ-GIzCWrw8L&ust=1706109924590000&source=images&cd=vfe&ved=0CBMQjRxqFwoTCODjhvbo84MDFQAAAAAdAAAAABAE")
              ),
              accountName: Text("Ashkan Chakari"),
              accountEmail: Text("ashkan.chakari@gmail.com"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
