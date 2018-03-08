import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/widgets/accountLayout.dart';

class Signup extends StatelessWidget{

  static final TextEditingController _email = new TextEditingController();
  static final TextEditingController _user = new TextEditingController();
  static final TextEditingController _password = new TextEditingController();
  static final TextEditingController _confirmPassword = new TextEditingController();

  String get userEmail => _email.text;
  String get userName => _user.text;
  String get password => _password.text;
  String get confirmPassword => _password.text;

  @override
  Widget build(BuildContext context){

    _onBack(){
      Navigator.of(context).pop();
    }

    _onSubmit(){
      if(this.userName == 'user' && this.password == "q"){
        Navigator.of(context).pushNamed('/settings');
      } else {
        Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("User is not valid")));
      }
    }


    return new AccountLayout(
      height: 220.0,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                  child: new Text(
                    "SIGN UP",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ],
          ),
          new TextField(controller: _email, decoration: new InputDecoration(hintText: "email")),
          new TextField(controller: _user, decoration: new InputDecoration(hintText: "user")),
          new TextField(controller: _password, decoration: new InputDecoration(hintText: "password") , obscureText: true,),
          new TextField(controller: _confirmPassword, decoration: new InputDecoration(hintText: "confirm password") , obscureText: true,),
        ],
      ),
      footer: new Row(
        children: <Widget>[
          new Expanded(
            child: new RaisedButton(onPressed: _onBack, child: new Text("Back"),),
          ),
          new Expanded(
            child: new RaisedButton(onPressed: _onSubmit, child: new Text("Sign up"),),
          ),
        ],
      ),
    );
  }
}