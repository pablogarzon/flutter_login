import 'package:flutter/material.dart';

class Home extends StatelessWidget{

  Home(String name){
    this._name = name;
  }

  String _name;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){
            Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
          })
        ],
      ),
      body: new Center(child: new Text("Welcome $_name"),),
    );
  }
}