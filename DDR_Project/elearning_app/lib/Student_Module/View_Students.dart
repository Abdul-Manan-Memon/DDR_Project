import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Student {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String photoUrl;

  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
    required this.photoUrl,
  });
}

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  List<Student> students = [];

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  Future<void> _fetchStudents() async {
    String jsonData = await rootBundle.loadString('assets/DATA/students.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<Student> fetchedStudents = jsonList.map((json) {
      return Student(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        phoneNumber: json['phoneNumber'],
        address: json['address'],
        photoUrl: json['photoUrl'],
      );
    }).toList();

    setState(() {
      students = fetchedStudents;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(students[index].name),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          StudentDetailsPage(student: students[index]),
                    ),
                  );
                },
                child: Text('View Details'),
              ),
            ),
          );
        },
      ),
    );
  }
}

class StudentDetailsPage extends StatelessWidget {
  final Student student;

  StudentDetailsPage({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student.name),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(student.photoUrl),
            ),
            SizedBox(height: 16),
            Text(
              'Name: ${student.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Email: ${student.email}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Phone Number: ${student.phoneNumber}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Address: ${student.address}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
