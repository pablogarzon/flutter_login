import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/screens/home.dart';
import 'package:flutter_login/widgets/accountLayout.dart';
import 'package:flutter_login/widgets/EnsureVisibleWhenFocused.dart';

class Login extends StatelessWidget{

  FocusNode _userfocusNode = new FocusNode();
  FocusNode _passfocusNode = new FocusNode();

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  //getters and setters
  String get userName => _user.text;
  String get password => _password.text;

  set userName(String value) => _user.text = value;
  set password(String value) => _password.text = value;

  @override
  Widget build(BuildContext context){

    void _showAlert(String message){
      Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(message)));
    }

    Future<Object> _loginUser() async{
      await http.get(
        "https://randomuser.me/api/?password=" + this.password,
      ).then((response) {
        if(response.statusCode == 200){
          Map data = JSON.decode(response.body.toString());
          var personData = data["results"][0]["login"];
          var name = personData["username"];
          Navigator.of(context).pushAndRemoveUntil(
            new PageRouteBuilder(pageBuilder: (_, __, ___) => new Home(name)),
            (Route<dynamic> route)=> false
          );
        } else {
          _showAlert("invalid user or password");
        }
      });
      this.password = "";
    }

    _onBack(){
      Navigator.of(context).pushNamed('/signup');
    }

    _onSubmit(){
      if(this.userName != "" && this.password != ""){
        _loginUser();
      } else {
        _showAlert("invalid user or password");
      }
    }

    return new AccountLayout(
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.only(bottom: 20.0),
                child: new Text(
                  "LOG IN",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ],
          ),
          new EnsureVisibleWhenFocused(
            focusNode: _userfocusNode,
            child: new TextField(controller: _user, decoration: new InputDecoration(hintText: "user"), focusNode: _userfocusNode,),
          ),
          new EnsureVisibleWhenFocused(
            focusNode: _passfocusNode,
            child: new TextField(controller: _password, decoration: new InputDecoration(hintText: "password") , obscureText: true, focusNode: _passfocusNode,),
          ),
        ],
      ),
      footer: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(onPressed: _onBack, child: new Text("Sign Up"),),
          ),
          new Expanded(
            child: new RaisedButton(onPressed: _onSubmit, child: new Text("Log in"),),
          ),
        ],
      ),
    );
  }
}