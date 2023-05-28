import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Course_Module/view_courses.dart';

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}

class CategoriesPage extends StatefulWidget {
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<Category> categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    String jsonData =
        await rootBundle.loadString('assets/DATA/categories.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<Category> fetchedCategories = jsonList.map((json) {
      return Category(
        id: json['id'],
        name: json['name'],
      );
    }).toList();

    setState(() {
      categories = fetchedCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(categories[index].name),
              trailing: ElevatedButton(
                onPressed: () {
                  // Navigate to view all courses in this category
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CoursesPage(
                        category: categories[index].name,
                      ),
                    ),
                  );
                },
                child: Text('View All'),
              ),
            ),
          );
        },
      ),
    );
  }
}
