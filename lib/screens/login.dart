import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

class login extends StatelessWidget{

  const login ({
    Key key,
    @required this.onSubmit,
  }): super(key: key);

  final VoidCallback onSubmit;

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get userName => _user.text;
  String get password => _password.text;

  @override
  Widget build(BuildContext context){
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Container(
              margin: new EdgeInsets.only(bottom: 20.0),
              child: new Text(
                "INICIAR SESION",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
          ],
        ),
        new TextField(controller: _user, decoration: new InputDecoration(hintText: "usuario")),
        new TextField(controller: _password, decoration: new InputDecoration(hintText: "password") , obscureText: true,),
        new Row(
          children: <Widget>[
            new RaisedButton(onPressed: onSubmit, child: new Text("Registrarse"),),
            new RaisedButton(onPressed: onSubmit, child: new Text("Ingresar"),)
          ],
        ),
      ],
    );
  }
}