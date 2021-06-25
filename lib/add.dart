import 'package:flutter/material.dart';
import 'package:minorproject/screens/address.dart';
import 'package:minorproject/screens/profile.dart';
import 'mysharedpreferences.dart';

class Addressroute extends StatefulWidget {
  const Addressroute({Key key}) : super(key: key);

  @override
  _AddressrouteState createState() => _AddressrouteState();
}

class _AddressrouteState extends State<Addressroute> {
  bool isLoggedIn = false;

  // ignore: non_constant_identifier_names
  Addressroute() {
    MySharedPreferences.instance
        .getBooleanValue("loggedin")
        .then((value) => setState(() {
              isLoggedIn = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Address Updated',
        home: isLoggedIn ? Profile() : Address());
  }
}
