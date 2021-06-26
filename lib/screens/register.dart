import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minorproject/screens/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String name, email, password;

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  register() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (user != null) {
          // ignore: deprecated_member_use
          await _auth.currentUser.updateProfile(displayName: name);
        }
      }
      catch (e) {
        print(e);
      }
    }
  }

  showError(String errormessage) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(errormessage),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }

  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Theme.of(context).canvasColor),
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 8,
                      top: 30,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.close,
                                size: 30.0,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, "/");
                              }),
                          Text(
                            'Close',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
                    Positioned(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
                width: 50,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Enter Name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    onSaved: (input) => name = input),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.isEmpty) {
                                        return 'Enter Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Email',
                                      prefixIcon: Icon(Icons.email),
                                    ),
                                    onSaved: (input) => email = input),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: TextFormField(
                                    validator: (input) {
                                      if (input.length < 6) {
                                        return 'Provide Minimum 6 Character';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Password',
                                      prefixIcon: Icon(Icons.lock),
                                    ),
                                    obscureText: true,
                                    onSaved: (input) => password = input),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 350,
                        height: 60,
                        child: ElevatedButton(
                          child: Text(
                            'REGISTER'.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF80E1D1)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        color: Colors.white, width: 3)),
                              )),
                          onPressed: register,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                child: Text('click here to Login'),
                onTap: navigateToLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
