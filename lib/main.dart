import 'package:TeamWorkPrototype/pages/addProject.dart';
import 'package:TeamWorkPrototype/pages/detailProject.dart';
import 'package:TeamWorkPrototype/pages/home.dart';
import 'package:TeamWorkPrototype/pages/joinProject.dart';
import 'package:TeamWorkPrototype/pages/login.dart';
import 'package:TeamWorkPrototype/pages/manageProject.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Work Prototype',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TeamWorkDetailProjectPage(title: 'Team Work Prototype'),
    );
  }
}
