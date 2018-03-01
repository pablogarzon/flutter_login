import 'package:flutter/material.dart';
import 'package:flutter_login/screens/account/login.dart';
import 'package:flutter_login/screens/account/changePassword.dart';
import 'package:flutter_login/screens/account/accountRecovery.dart';
import 'package:flutter_login/screens/account/signup.dart';
import 'package:flutter_login/screens/home.dart';

void main() => runApp(new MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String _title="Main Page";

  void _goHome(){

  }

  void _logout(){

  }

  final GlobalKey<ScaffoldState> _scaffoldState = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      key: _scaffoldState,
      title: "Login Demo",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/accountRecovery': (BuildContext context) => new AccountRecovery(),
        '/changePassword': (BuildContext context) => new ChangePassword(),
        '/login': (BuildContext context) => new Login(),
        '/signup': (BuildContext context) => new Signup(),
        //'/home': (BuildContext context) => new Home(),
      },
      home: new Scaffold(
        body: new Login(),
      )
    );
  }
}