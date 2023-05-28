import 'package:elearning_app/HomePage.dart';
import 'package:flutter/material.dart';

import 'Categories.dart';
import 'Student_Module/View_Students.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LandingHomePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Categories'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriesPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Students'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StudentPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
