import 'package:flutter/material.dart';
import 'package:others/home.dart';
import 'package:others/loginpage.dart';
import 'package:others/registerpage.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ArtGram",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: LoginPage(),
      routes: {
        '/homePage':(context)=>Home(),
        '/loginPage':(context)=>LoginPage(),
        '/registerPage':(context)=>RegisterPage(),
      },
    );
  }
}
