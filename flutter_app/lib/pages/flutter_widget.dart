import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

/*
* Flutter Widget 库介绍   cupertino iOS风格
* */


class CupertinoTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('cupertino Demo'),
        ),
        child: Center(
          child: CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text('Press'),
              onPressed:() {}
              ),
        ),
    );
  }
}


class TextWidgetTestDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text('TextWidget'),
      ),
      body: Center(
        child: Text('Hello world',
          textAlign: TextAlign.center,
          style: new TextStyle(
            color: Colors.blueAccent,
            fontSize: 20.0,
            height: 1.2,
            fontFamily: 'Courier',
            background: new Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed,
          ),
        ),
      ));
  }
}