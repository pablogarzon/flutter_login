import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_login/widgets/accountLayout.dart';

class changePassword extends StatelessWidget{

  static final TextEditingController _oldPassword = new TextEditingController();
  static final TextEditingController _newPassword = new TextEditingController();
  static final TextEditingController _confirmPassword = new TextEditingController();

  String get userName => _oldPassword.text;
  String get password => _newPassword.text;

  @override
  Widget build(BuildContext context){
    return new accountLayout(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                    child: new Text(
                      "CAMBIAR CONTRASEÑA",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ),
              ],
            ),
            new TextField(controller: _oldPassword, decoration: new InputDecoration(hintText: "contraseña actual"), obscureText: true),
            new TextField(controller: _newPassword, decoration: new InputDecoration(hintText: "nueva contraseña") , obscureText: true,),
            new TextField(controller: _confirmPassword, decoration: new InputDecoration(hintText: "confirmar contraseña") , obscureText: true,),
            new Row(
              children: <Widget>[
                new RaisedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: new Text("Volver"),),
                new RaisedButton(onPressed: null, child: new Text("Guardar"),)
              ],
            ),
          ],
        )
    );
  }
}