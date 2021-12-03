// @dart=2.9
import 'package:flutter/material.dart';
import 'package:remedy/Pages/home_page.dart';
import 'package:remedy/Unused/login_page.dart';
import 'package:remedy/Unused/sign_up_page.dart';

void main() async{

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.deepPurple,
      ),
      home: LoginPage(title: 'Remedy',),
    );
  }
}
