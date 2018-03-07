import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/screens/home.dart';
import 'package:flutter_login/widgets/accountLayout.dart';

class Login extends StatelessWidget{

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
          var userName = personData["username"];
          this.password = "";
          Navigator.of(context).pushAndRemoveUntil(
            new PageRouteBuilder(pageBuilder: (_, __, ___) => new Home(userName)),
            (Route<dynamic> route)=> false
          );
        } else {
          _showAlert("Usuario o cuenta no válidos");
        }
      });
    }

    _onBack(){
      Navigator.of(context).pushNamed('/signup');
    }

    _onSubmit(){
      if(this.userName != "" && this.password.length > 6){
        _loginUser();
      } else {
        _showAlert("Debe ingresar un usuario y una contrasea");
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
                  "INICIAR SESIÓN",
                  style: new TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ],
          ),
          new TextField(controller: _user, decoration: new InputDecoration(hintText: "usuario")),
          new TextField(controller: _password, decoration: new InputDecoration(hintText: "password") , obscureText: true,),
        ],
      ),
      footer: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(onPressed: _onBack, child: new Text("Registrarse"),),
          ),
          new Expanded(
            child: new RaisedButton(onPressed: _onSubmit, child: new Text("Ingresar"),),
          ),
        ],
      ),
    );
  }
}