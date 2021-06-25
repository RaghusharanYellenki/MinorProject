import 'package:flutter/material.dart';
import 'package:minorproject/home.dart';
import 'package:minorproject/mysharedpreferences.dart';

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<Profile> {
  String name = "";
  String buildingname = "";
  String locality = "";
  String city = "";
  String pincode = "";

  ProfileState() {
    MySharedPreferences.instance
        .getStringValue("name")
        .then((value) => setState(() {
              name = value;
            }));
    MySharedPreferences.instance
        .getStringValue("buildingname")
        .then((value) => setState(() {
              buildingname = value;
            }));
    MySharedPreferences.instance
        .getStringValue("locality")
        .then((value) => setState(() {
              locality = value;
            }));
    MySharedPreferences.instance
        .getStringValue("city")
        .then((value) => setState(() {
              city = value;
            }));
    MySharedPreferences.instance
        .getStringValue("pincode")
        .then((value) => setState(() {
              pincode = value;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://www.searchpng.com/wp-content/uploads/2019/02/Deafult-Profile-Pitcher.png'),
                  radius: 80,
                ),
              ),
              Text(
                "Address Updated ",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                buildingname,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                locality,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                city,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              Text(
                pincode,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 150,
                height: 50,
                // ignore: deprecated_member_use
                child: RaisedButton(
                    color: Colors.blue,
                    child: Text('Add address'),
                    onPressed: () {
                      MySharedPreferences.instance.removeAll();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
