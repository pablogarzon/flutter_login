import 'package:flutter/material.dart';
import 'package:flutter_login/screens/settings.dart';
import 'package:flutter_login/screens/login.dart';

void main() => runApp(new MainPage());

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String _title="Main Page";

  Widget _screen;
  login _login;
  settings _settings;
  bool _authenticated;

  _MainPageState(){
    _login= new login(onSubmit: (){ onSubmit(); });
    _settings= new settings();
    _screen = _login;
    _authenticated = false;
  }

  void onSubmit(){
    if(_login.userName == 'user' && _login.password == "q"){
      _setAuthenticated(true);
    }
  }

  void _goHome(){
    setState((){
      if(_authenticated==true){
        _screen = _settings;
        _title = "Welcome";
      } else {
        _screen = _login;
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
        _screen = _settings;
        _title = "settings";
      } else {
        _screen = _login;
        _title = "login";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Login Demo",
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new login(onSubmit: (){ onSubmit(); }),
        '/settings': (BuildContext context) => new settings(),
      },
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: _goHome),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: _logout)
          ],
        ),
        body: new Container(
          decoration: new BoxDecoration(
            color: Colors.cyan,
          ),
          padding: new EdgeInsets.only(left: 25.0, right: 25.0),
          child: new Stack(
            children: <Widget>[
              new Align(
                alignment: new Alignment(0.0, 0.5),
                child: new Card(
                  child: new Container(
                      height: 200.0,
                      width: 350.0,
                      color: Colors.white,
                      margin:  new EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
                      padding: const EdgeInsets.all(10.0),
                      child: _screen
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}