import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;




// 定义TAB对象，这样做的好处就是，可以灵活定义每个tab页用到的对象，可结合Iterable对象使用
class NewsTab{
  String text;
  NewsList newsList;
  NewsTab(this.text,this.newsList);
}

class News extends StatefulWidget {
  const News({Key key, this.data}) : super(key: key);
  final String data;
  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}


class _MyTabbedPageState extends State<News>
    with SingleTickerProviderStateMixin {
  final List<NewsTab> myTabs = <NewsTab>[
    new NewsTab('头条', new NewsList(newsType: 'top',)),
  new NewsTab('社会',new NewsList(newsType: 'shehui')),
  new NewsTab('国内',new NewsList(newsType: 'guonei')),
  new NewsTab('国际',new NewsList(newsType: 'guoji')),
  new NewsTab('娱乐',new NewsList(newsType: 'yule')),
  new NewsTab('体育',new NewsList(newsType: 'tiyu')),
  new NewsTab('军事',new NewsList(newsType: 'junshi')),
  new NewsTab('科技',new NewsList(newsType: 'keji')),
  new NewsTab('财经',new NewsList(newsType: 'caijing')),
  new NewsTab('时尚',new NewsList(newsType: 'shishang')),
  ];

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orangeAccent,
        title: new TabBar(
          controller: _tabController,
          tabs: myTabs.map((NewsTab item){
            return new Tab(text: item.text == null?'错误':item.text);
          }).toList(),// 要用toList()转换一个map结果，否则会由于类型不匹配而报错
          indicatorColor: Colors.white,
          isScrollable: true, // 水平滚动的开关
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        // ignore: argument_type_not_assignable
        children: myTabs.map((item) {
          return item.newsList;
        }).toList(),
      ),
    );
  }
}



// 列表的长度不定，需要用有状态列表来承载列表
class NewsList extends StatefulWidget{
  final String newsType;    //新闻类型
  @override
  NewsList({Key key, this.newsType} ):super(key:key);

  _NewsListState createState() => new _NewsListState();
}

class _NewsListState extends State<NewsList>{
  final String _url = 'http://v.juhe.cn/toutiao/index?';
  List data;

  // 数据请求 避开Future的方法
  Future<String> getSWData(String category) async{
    var request = await http.get(Uri.parse('${_url}type=$category&key=61168177415b3f663f8a527ef0b167f3'));
    setState(() {
      var res = json.decode(request.body);
      data = res['result']['data'];
    });
    return 'Success!';
  }

  // 数据请求 直面Future的方法
  Future<String> get(String category) async{
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse('${_url}type=$category&key=61168177415b3f663f8a527ef0b167f3'));
    var response = await request.close();
    return await response.transform(utf8.decoder).join();
  }

  getData() async{
    var res = await get(widget.newsType);
    if(!mounted) return; // 异步处理，防止报错
    setState(() {
      data = jsonDecode(res)['result']['data'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context){
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (context, i) {
          return _newsRow(data[i]);//把数据项塞入ListView中
        }
    );
  }

  // 渲染视图
  Widget _newsRow(newInfo){
    return new Card(
      child: new Column(
        children: <Widget>[
          new Container(
            child: new ListTile(title: new Text(newInfo['title'],textScaleFactor: 1.5,),),
            margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          ),
          _generateItem(newInfo),
          new Container(
            padding: const EdgeInsets.fromLTRB(25.0, 10.0, 0.0, 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Expanded(child: new Text(newInfo['author_name'])),
                new Expanded(child: new Text(newInfo['date'])),
              ],
            ),
          ),


        ],
      ),
    );
  }

  // 图片加载样式
  _generateItem(Map newsInfo){
    if (newsInfo['thumbnail_pic_s'] != null &&
        newsInfo['thumbnail_pic_s02'] != null &&
        newsInfo['thumbnail_pic_s03'] != null){
      return _generateThreePicItem(newsInfo);
    }else{
      return _generateOnePicItem(newsInfo);
    }
  }

  // 仅一张图片的样式
  _generateOnePicItem(Map newsInfo){
    return new Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Expanded(child: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new SizedBox(
            child: new Image.network(
              newsInfo['thumbnail_pic_s'],
              fit: BoxFit.fitWidth,
            ),
            height: 200.0,
          ),
        ))
      ],
    );
  }

  _generateThreePicItem(Map newsInfo){
    return new Row(
      children: <Widget>[
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['thumbnail_pic_s'])
            )
        ),
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['thumbnail_pic_s02'])
            )
        ),
        new Expanded(
            child: new Container(
                padding: const EdgeInsets.all(4.0),
                child: new Image.network(newsInfo['thumbnail_pic_s03'])
            )
        )
      ],
    );
  }


}