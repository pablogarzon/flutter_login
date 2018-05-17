import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountLayout extends StatelessWidget {

  const AccountLayout ({
    Key key,
    this.body,
    this.footer,
    this.height= 170.0,
    this.width= 350.0,
  }): super(key: key);

  final Widget body;
  final Widget footer;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        decoration: new BoxDecoration(
          color: Colors.blueAccent,

        ),
        padding: new EdgeInsets.all(30.0),
        child: new Center(
          child: new ListView(
            children: <Widget>[
              new Container(
                child: new FlutterLogo(
                  size: 120.0,
                ),
                margin: new EdgeInsets.only(top: 20.0, bottom: 70.0),
              ),
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Container(
                        height: height,
                        width: width,
                        color: Colors.white,
                        margin:  new EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        child: this.body
                    ),
                    this.footer
                  ],
                )
              ),
            ],
          ),
        ),
      )
    );
  }
}