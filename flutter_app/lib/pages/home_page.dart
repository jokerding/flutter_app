import 'package:flutter/material.dart';
import './other_page.dart';
import 'tabPage/tab_page_1.dart';
import 'tabPage/tab_page_2.dart';
import 'tabPage/tab_page_3.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Tab> _bottomTabs = <Tab>[
    new Tab(
      text: 'Home',
      icon: new Icon(Icons.home),
    ),
    new Tab(
      text: 'Music',
      icon: new Icon(Icons.music_note),
    ),
    new Tab(
      text: 'Book',
      icon: new Icon(Icons.book),
    ),
  ];

  TabController _bottomNavigation;

  @override
  void initState() {
    super.initState();
    _bottomNavigation =
        new TabController(length: _bottomTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _bottomNavigation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: new Text('学习tabar'),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("小丁丁"), // 用户昵称
              accountEmail: new Text("37477035@qq.com"), // 用户邮箱
              currentAccountPicture: new GestureDetector(
                // 用户头像  可以更换
                onTap: () => print('这个是我的头像啊'),
                child: new CircleAvatar(
                  // 圆形图标控件
                  backgroundImage: new NetworkImage(
                      'http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=b9dece7e3ea85edfee81f660213d6356/8cb1cb1349540923d8bbc4509858d109b2de49c9.jpg'),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => print('这个是粉丝1的图像'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        'http://imgsrc.baidu.com/imgad/pic/item/4b90f603738da977b409c334ba51f8198618e38f.jpg'),
                  ),
                ),
                new GestureDetector(
                  onTap: () => print('这个是粉丝2的图像'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        'http://imgsrc.baidu.com/imgad/pic/item/dc54564e9258d1095f5433b5db58ccbf6c814d06.jpg'),
                  ),
                ),
              ],
              decoration: new BoxDecoration(
                //用一个BoxDecoration装饰器提供背景图
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: new ExactAssetImage('images/lake.jpg')),
              ),
            ),
            new ListTile(
              title: new Text('第一页'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new OtherPage('第一页')));
              },
            ),
            new ListTile(
              title: new Text('第二页'),
              trailing: new Icon(Icons.arrow_right),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new OtherPage('第二页')));
              },
            ),
            new ListTile(
              title: new Text('第三页'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "three");
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('关闭'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
      body: new TabBarView(
        controller: _bottomNavigation,
        children: <Widget>[
          new News(
            data: '参数值',
          ),
          new TabPage2(),
          new TabPage3(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.deepOrange,
        child: new TabBar(
          controller: _bottomNavigation,
          tabs: _bottomTabs,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}

/*
*  侧边栏教程

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Flutter 学习"),backgroundColor: Colors.redAccent,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("小丁丁"), // 用户昵称
              accountEmail: new Text("37477035@qq.com"),// 用户邮箱
              currentAccountPicture: new GestureDetector( // 用户头像  可以更换
                onTap: () => print('这个是我的头像啊'),
                child: new CircleAvatar( // 圆形图标控件
                  backgroundImage: new NetworkImage('http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=b9dece7e3ea85edfee81f660213d6356/8cb1cb1349540923d8bbc4509858d109b2de49c9.jpg'),
                ),
              ),
              otherAccountsPictures: <Widget>[
                new GestureDetector(
                  onTap: () => print('这个是粉丝1的图像'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('http://imgsrc.baidu.com/imgad/pic/item/4b90f603738da977b409c334ba51f8198618e38f.jpg') ,
                  ),
                ),
                new GestureDetector(
                  onTap: () => print('这个是粉丝2的图像'),
                  child: new CircleAvatar(
                    backgroundImage: new NetworkImage('http://imgsrc.baidu.com/imgad/pic/item/dc54564e9258d1095f5433b5db58ccbf6c814d06.jpg') ,
                  ),
                ),
              ],
              decoration: new BoxDecoration(//用一个BoxDecoration装饰器提供背景图
                image: new DecorationImage(fit:BoxFit.fill,
                    image: new ExactAssetImage('images/lake.jpg')
                ),
              ),
            ),
            new ListTile(
              title: new Text('第一页'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('第一页')));
              },
            ),
            new ListTile(
              title: new Text('第二页'),
              trailing: new Icon(Icons.arrow_right),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new OtherPage('第二页')));
              },
            ),
            new ListTile(
              title: new Text('第三页'),
              trailing: new Icon(Icons.arrow_upward),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/a');
              },
            ),
            new Divider(),
            new ListTile(
              title: new Text('关闭'),
              trailing: new Icon(Icons.cancel),
              onTap: () => Navigator.of(context).pop(),
            ),
                
          ],

        ),
      ),
      body: new Center(
        child: new Text("首页-我就是我",style: new TextStyle(fontSize: 35.0),),
      ),
    );
  }
}

*/
