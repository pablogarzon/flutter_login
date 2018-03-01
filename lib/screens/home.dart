import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  Home(String username){
    this._username = username;
  }

  String _username;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body: new Center(child: new Text("Welcome $_username"),),
    );
  }
}