import 'package:flutter/material.dart';

import 'courses.model.dart';
import 'course_service.dart';
import 'course_details.dart';

class CoursesPage extends StatefulWidget {
  final String category;

  CoursesPage({required this.category});

  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  List<Course> courses = [];

  @override
  void initState() {
    super.initState();
    _fetchCourses();
  }

  Future<void> _fetchCourses() async {
    List<Course> fetchedCourses =
        await CourseProvider.fetchCoursesByCategory(widget.category);
    setState(() {
      print(fetchedCourses);
      courses = fetchedCourses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(courses[index].title),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CourseDetailsPage(course: courses[index]),
                    ),
                  );
                },
                child: Text('View Details'),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CourseDetailsPage(course: courses[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
