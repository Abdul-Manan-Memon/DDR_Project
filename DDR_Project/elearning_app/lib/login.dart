import 'package:elearning_app/Student_Module/Student_Dashboard.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email/Username'),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StudentDashboard(
                              name: 'Abdul Manan',
                              email: 'mananmemon99@gmail.com',
                              phoneNumber: '+92 333 3635058',
                              address: 'FAST-University',
                            )));
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text('Forgot password?'),
            ),
          ],
        ),
      ),
    );
  }
}
