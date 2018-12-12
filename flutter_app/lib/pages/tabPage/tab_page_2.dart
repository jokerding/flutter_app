import 'package:flutter/material.dart';

class TabPage2 extends StatelessWidget{
  final List<Tab> myTabls = <Tab>[
    new Tab(text: 'LEFT',),
    new Tab(text: 'RIGHT',),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new DefaultTabController(
        length: myTabls.length,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.orangeAccent,
            title: new TabBar(
              tabs: myTabls,
              indicatorColor: Colors.white,
            ),
          ),
          body: new TabBarView(
            children: myTabls.map((Tab tab){
            return new Center(child: new Text(tab.text));
            }).toList(),
          ),
        ),
    );
  }
}
