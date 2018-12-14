import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/state_lief_cycle.dart';


void main() => runApp(new MaterialApp(
//    home: new HomePage(),
      title: '生命周期',
      theme: new ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: new StateLiefCycle(),
  )
);

