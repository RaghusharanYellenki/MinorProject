import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developed By"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  'DevelopedBy: ',
                  style: TextStyle(
                      height: 5, fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.copyright_rounded,size: 40),
                SizedBox(
                  height: 0,
                  width: 25,
                ),
                Text(
                  'yellenkiraghusharan@gmail.com',
                  style: TextStyle(
                      height: 2, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  '+91 6305438811',
                  style: TextStyle(
                      height: 2, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
