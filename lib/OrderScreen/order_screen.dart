import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: Text("this is the Order Page"),
        ),
      ),
    );
  }
}