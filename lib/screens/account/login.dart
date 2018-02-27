import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/widgets/accountLayout.dart';

class login extends StatelessWidget{

  const login ({
    Key key,
  }): super(key: key);

  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();

  String get userName => _user.text;
  String get password => _password.text;

  @override
  Widget build(BuildContext context){

    _onBack(){
      Navigator.of(context).pushNamed('/signup');
    }

    _onSubmit(){
      if(this.userName == 'user' && this.password == "q"){
        Navigator.of(context).pushNamed('/settings');
      } else {
        Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Usuario o cuenta no válidos")));
      }
    }


    return new accountLayout(
      new Column(
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
          new Row(
            children: <Widget>[
              new RaisedButton(onPressed: _onBack, child: new Text("Registrarse"),),
              new RaisedButton(onPressed: _onSubmit, child: new Text("Ingresar"),)
            ],
          ),
        ],
      )
    );
  }
}