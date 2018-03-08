import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/widgets/accountLayout.dart';

class AccountRecovery extends StatelessWidget{

  static final TextEditingController _email = new TextEditingController();

  String get userEmail => _email.text;


  @override
  Widget build(BuildContext context){

    _onBack(){
      Navigator.of(context).pop;
    }

    _onSubmit(){
    }


    return new AccountLayout(
      body: new Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                  child: new Text(
                    "FORGOT PASSWORD?",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
              ),
            ],
          ),
          new Text("Input your email and we send you a new password."),
          new TextField(controller: _email, decoration: new InputDecoration(hintText: "email")),
        ],
      ),
      footer: new Row(
        children: <Widget>[
          new RaisedButton(onPressed: _onBack, child: new Text("Back"),),
          new RaisedButton(onPressed: _onSubmit, child: new Text("Send"),)
        ],
      ),
    );
  }
}