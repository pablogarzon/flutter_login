import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/widgets/accountLayout.dart';

class ChangePassword extends StatelessWidget{

  static final TextEditingController _oldPassword = new TextEditingController();
  static final TextEditingController _newPassword = new TextEditingController();
  static final TextEditingController _confirmPassword = new TextEditingController();

  String get userName => _oldPassword.text;
  String get password => _newPassword.text;

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
                      "CHANGE PASSWORD",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ],
            ),
            new TextField(controller: _oldPassword, decoration: new InputDecoration(hintText: "current password"), obscureText: true),
            new TextField(controller: _newPassword, decoration: new InputDecoration(hintText: "new password") , obscureText: true,),
            new TextField(controller: _confirmPassword, decoration: new InputDecoration(hintText: "confirm password") , obscureText: true,),
          ],
        ),
      footer: new Row(
        children: <Widget>[
          new RaisedButton(onPressed: _onBack, child: new Text("Back"),),
          new RaisedButton(onPressed: _onSubmit, child: new Text("Save"),)
        ],
      ),
    );
  }
}