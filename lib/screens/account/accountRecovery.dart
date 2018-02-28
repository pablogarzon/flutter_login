import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_login/widgets/accountLayout.dart';

class accountRecovery extends StatelessWidget{

  static final TextEditingController _email = new TextEditingController();

  String get userEmail => _email.text;


  @override
  Widget build(BuildContext context){

    _onBack(){
      Navigator.of(context).pop;
    }

    _onSubmit(){
    }


    return new accountLayout(
      child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Container(
                    child: new Text(
                      "¿Olvidó su contraseña?",
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
              ],
            ),
            new Text("Introduzca el email que utilizó para registrarse y le enviaremos su nueva contraseña."),
            new TextField(controller: _email, decoration: new InputDecoration(hintText: "Correo electrónico")),
            new Row(
              children: <Widget>[
                new RaisedButton(onPressed: _onBack, child: new Text("Volver"),),
                new RaisedButton(onPressed: _onSubmit, child: new Text("Ingresar"),)
              ],
            ),
          ],
        )
    );
  }
}