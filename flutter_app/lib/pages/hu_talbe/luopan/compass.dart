import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter_refresh/flutter_refresh.dart';

class CompassPage extends StatefulWidget{
      @override
      CompassPageState createState() => new CompassPageState();
}


class CompassPageState extends State<CompassPage>{
  
  Future <Null>  onFooterRefresh(){
    return new Future.delayed(
        new Duration(seconds: 2),
        (){
            setState(() {
              
            });
        }
    );
  }
  
  Future <Null> onHeaderRefresh(){
    return new Future.delayed(new Duration(seconds: 2),
    (){
       setState(() {
         
       });
    });
  }
  
  
         
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
         title: new Text('界面1'),
      ),
      body: new Center(
        child: new Text('这是一个界面'),
      ),
    );
     return new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,

     );
  }
}

