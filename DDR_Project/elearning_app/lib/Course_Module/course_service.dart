import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'courses.model.dart';

class CourseProvider {
  static Future<List<Course>> fetchCoursesByCategory(String category) async {
    String jsonData = await rootBundle.loadString('assets/DATA/courses.json');

    List<dynamic> jsonList = json.decode(jsonData);

    List<Course> courses =
        jsonList.where((json) => json['category'] == category).map((json) {
      return Course(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        category: json['category'] ?? '',
      );
    }).toList();
    return courses;
  }
}
