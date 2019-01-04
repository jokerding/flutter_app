
import 'package:flutter/material.dart';

import 'cesuan/cesuan.dart';
import 'luopan/compass.dart';
import 'fengshui/fengshui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget{
  @override
  HomaPageState createState() => new HomaPageState();
}

class HomaPageState extends State<HomePage> with SingleTickerProviderStateMixin{
    TabController controller;
    @override
     void initState() {
      // TODO: implement initState
       super.initState();
       controller = new TabController(length: 3, vsync: this);
     }
  
     @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);
    return new Scaffold(
      body: new TabBarView(
        controller: controller,
          children: <Widget>[
            new CesuanPage(),
            new CompassPage(),
            new FenshuiPage(),
          ]),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
              controller: controller,
              tabs: <Tab>[
             new Tab(text: "测算",icon: new Icon(Icons.home)),
             new Tab(text: "罗盘",icon: new Icon(Icons.message)),
             new Tab(text: "我的",icon: new Icon(Icons.cloud)),
          ]),
        ),
    );
  }
}