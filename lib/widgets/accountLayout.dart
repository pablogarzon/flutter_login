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
      body: new Container(
        decoration: new BoxDecoration(
          color: Colors.blueAccent,

        ),
        padding: new EdgeInsets.all(30.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                child: new FlutterLogo(
                  size: 120.0,
                ),
                margin: new EdgeInsets.only(bottom: 50.0),
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