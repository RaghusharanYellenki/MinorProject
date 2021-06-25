import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:minorproject/home.dart';
import 'package:minorproject/home2.dart';
import 'package:minorproject/screens/login.dart';
import 'package:minorproject/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          hintColor: Color(0xFFC0F0E8),
          primaryColor: Color(0xFF80E1D1),
          fontFamily: "Montserrat",
          canvasColor: Colors.transparent),
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: <String, WidgetBuilder>{
        "Login": (BuildContext context) => Login(),
        "Register": (BuildContext context) => Register(),
        "Startpage": (BuildContext context) => Home2(),
      },
    );
  }
}
