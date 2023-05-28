import 'package:elearning_app/MyDrawer.dart';
import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String address;

  StudentDashboard({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/images/Students.png'),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Name: $name',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Email: $email',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Phone Number: $phoneNumber',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 20),
          Text(
            'Address: $address',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
