import 'package:flutter/material.dart';
import 'package:lawnmower/screen/home.dart';
import 'package:lawnmower/screen/loginpage.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      title: 'test1',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      
    );
  }
}

  