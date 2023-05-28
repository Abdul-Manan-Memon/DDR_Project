import 'package:flutter/material.dart';

import 'login.dart';
import 'Signup.dart';
import 'MyDrawer.dart';

class LandingHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('E-learning App')),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/homepage.png',
              width: screenSize.width,
              height: screenSize.height / 4,
            ),
            SizedBox(height: 20),
            Text(
              'Learn from top universities and companies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Build skills with courses, certificates, and degrees online from world-class institutions.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40),
            Image.asset(
              'assets/images/Categories.png',
              width: screenSize.width,
              height: screenSize.height / 4,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupPage()),
                );
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
