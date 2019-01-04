import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/three_page.dart';
//import './pages/state_lief_cycle.dart';
//import './pages/flutter_widget.dart';

//import './pages/hu_talbe/home_page.dart';


void main() => runApp(new MaterialApp(
  routes: {
    // ignore: expected_token
    'three':(BuildContext context) => new ThreePage(),
  },
    home: new HomePage(),
//      title: '生命周期',
//      theme: new ThemeData(
//        primaryColor: Colors.redAccent,
//      ),
//      home: new StateLiefCycle(),
  )
);

//
//void main() => runApp(new MaterialApp(
//      title: 'test',
//      theme: new ThemeData(
//        primaryColor: Colors.redAccent,
//      ),
////      home: new CupertinoTestRoute(),
//      home: new TextWidgetTestDemo(),
//)
//
//);
