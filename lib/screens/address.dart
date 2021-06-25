import 'package:flutter/material.dart';
import 'package:minorproject/screens/profile.dart';

import '../mysharedpreferences.dart';

class Address extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddressState();
  }
}

class AddressState extends State<Address> {
  TextEditingController controllername = new TextEditingController();
  TextEditingController controllerbuildingname = new TextEditingController();
  TextEditingController controllerlocality = new TextEditingController();
  TextEditingController controllercity = new TextEditingController();
  TextEditingController controllerpincode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title: Text('Enter address'),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Form(
                      autovalidateMode: AutovalidateMode.disabled,
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Full name:",
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(width: 40),
                              Expanded(
                                child: TextFormField(
                                  controller: controllername,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: "Full name",
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return "Name is Required";
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Building name:",
                                  style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  controller: controllerbuildingname,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: "buildingname",
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return "buildingname is Required";
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("locality:", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  controller: controllerlocality,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: "locality",
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return "locality is Required";
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("city:", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  controller: controllercity,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: "city",
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return "city";
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("pincode:", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 20),
                              Expanded(
                                child: TextFormField(
                                  controller: controllerpincode,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    hintText: "pincode",
                                  ),
                                  validator: (value) {
                                    if (value.trim().isEmpty) {
                                      return "pincode is Required";
                                    }
                                    return null;
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              child: Text("ADD ADDRESS",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13)),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  var getname = controllername.text;
                                  var getbuildingname =
                                      controllerbuildingname.text;
                                  var getlocality = controllerlocality.text;
                                  var getcity = controllercity.text;
                                  var getpincode = controllerpincode.text;

                                  MySharedPreferences.instance
                                      .setStringValue("name", getname);
                                  MySharedPreferences.instance.setStringValue(
                                      "buildingname", getbuildingname);
                                  MySharedPreferences.instance
                                      .setStringValue("locality", getlocality);
                                  MySharedPreferences.instance
                                      .setStringValue("city", getcity);
                                  MySharedPreferences.instance
                                      .setStringValue("pincode", getpincode);
                                  MySharedPreferences.instance
                                      .setBooleanValue("loggedin", true);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => Profile()),
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
