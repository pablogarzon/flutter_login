import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountLayout extends StatelessWidget {

  const AccountLayout ({
    Key key,
    this.child
  }): super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
                  height: 220.0,
                  width: 350.0,
                  color: Colors.white,
                  margin:  new EdgeInsets.only(left: 15.0, right: 15.0),
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
                  child: this.child
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}