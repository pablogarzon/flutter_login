import 'package:flutter/material.dart';
import 'package:flutter_login/screens/account/login.dart';
import 'package:flutter_login/screens/account/changePassword.dart';
import 'package:flutter_login/screens/account/accountRecovery.dart';
import 'package:flutter_login/screens/account/signup.dart';
import 'package:flutter_login/screens/settings.dart';
import 'package:flutter_login/screens/home.dart';

void main() => runApp(new MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String _title="Main Page";
  bool _authenticated;

  _MainPageState(){
    _authenticated = false;
  }

  void _goHome(){
    setState((){
      if(_authenticated==true){
       // _screen = _settings;
        _title = "Welcome";
      } else {
        //_screen = _login;
        _title = "Please Login";
      }
    });
  }

  void _logout(){
    _setAuthenticated(false);
  }

  void _setAuthenticated(bool auth){
    setState(() {
      _authenticated = auth;
      if(auth == true){
        //_screen = _settings;
        _title = "settings";
      } else {
        //_screen = _login;
        _title = "login";
      }
    });
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
        '/accountRecovery': (BuildContext context) => new accountRecovery(),
        '/changePassword': (BuildContext context) => new changePassword(),
        '/login': (BuildContext context) => new login(),
        '/signup': (BuildContext context) => new signup(),
        '/settings': (BuildContext context) => new settings(),
        '/home': (BuildContext context) => new home(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: _goHome),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: _logout)
          ],
        ),
        body: new login(),
      ),
    );
  }
}