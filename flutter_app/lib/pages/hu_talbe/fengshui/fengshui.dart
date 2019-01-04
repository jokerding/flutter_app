import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class FenshuiPage extends StatefulWidget{
  @override
  FenshuiPageState createState() => new FenshuiPageState();
}


class FenshuiPageState extends State<FenshuiPage>{
  @override
  Widget build(BuildContext context) {

    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32),
      child: new Row(
        children: [
          new Expanded(
              child:new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: new Text(
                      '大黄是个 3b',
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  new Text(
                    'test test flutter',
                    style: new TextStyle(
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              )
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );

    Column buildButtonColumn(IconData icon,String label){
       Color color = Theme.of(context).primaryColor;
       return new Column(
         mainAxisSize: MainAxisSize.min,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           new Icon(icon,color: color),
           new Container(
             margin: const EdgeInsets.only(top: 8.0),
             child: new Text(
               label,
               style: new TextStyle(
                 fontSize: 12.0,
                 fontWeight: FontWeight.w400,
                 color: color,
               ),
             ),
           ),
         ],
       );
    }

    Widget buttonSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE'),
        ],
      ),
    );

    Widget textSetion = new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
          '''
             testa a jlajdfkajkldjaljdfajlfajdl;fjkajddfadfa dfdaggsfglsmflgslkfgslflgksjfgkl;sjfklgsjfjglksjfgskjfgk
          ''',
      ),
    );


    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('界面3'),
      ),
      body: new ListView(
        children: <Widget>[
          new Image.asset('images/chongzhi@2x.png',width: 600,height: 240,fit: BoxFit.cover),
          titleSection,
          buttonSection,
          textSetion,
        ],
      ),
    );
  }
}



