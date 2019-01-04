import 'package:flutter/material.dart';


class ThreePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new ThreePageState();
  }
}

class ThreePageState extends State<ThreePage>{
  
  String _bodyStr = 'Test';
  // ListTile 样式
  PopupMenuItem popItem_ListItle(String value,String text,IconData icon){
    return new PopupMenuItem<String>(
        value: value,
        child: ListTile(leading: Icon(icon),title: Text(text)),
    );
  }
  // 自定义样式
  PopupMenuItem popItem_Custom(String value,String text,IconData icon){
    return new PopupMenuItem<String>(
        value: value,
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Icon(icon),
            ),
            Text(text),
          ],
        )
    );
  }
  
  PopupMenuItem popItem_check(String value, String text,bool checked){
    return new CheckedPopupMenuItem<String>(
      checked: checked,
      value: value,
      child: new Text(text),
    );
  }

  //  普通样式
  Widget _NomalPopMenu(){
    return new PopupMenuButton<String>(
      itemBuilder:(BuildContext context) =><PopupMenuItem<String>>[
        new PopupMenuItem<String>(
            value:'value01',
            child: new Text('Item One')),
        new PopupMenuItem<String>(
            value: 'value02',
            child: new Text('Item Two')),
        new PopupMenuItem<String>(
            value: 'value03',
            child: new Text('Item Three')),
        new PopupMenuItem<String>(
            value: 'value04',
            child: new Text('Item four')),
        new PopupMenuItem<String>(
            value: 'value05',
            child: ListTile(leading: Icon(Icons.looks_one),title: Text('ItemFive'))),
        popItem_ListItle('value06','ItemSix',Icons.looks_6,),
        popItem_Custom('value07', 'Item_seven', Icons.looks_3),
        popItem_check('value08', 'I am a one', false),

      ],
      onSelected: (String value){
        setState(() {
          _bodyStr = value;
        });
      },
    );
  }


  Widget _DeviderPopMenu(){
    return new PopupMenuButton(itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          new PopupMenuItem<String>( value: 'value01', child: new Text('Item One')),
          new PopupMenuDivider(height: 1.0),
          new PopupMenuItem<String>( value: 'value02', child: new Text('Item Two')),
          new PopupMenuDivider(height: 1.0),
          new PopupMenuItem<String>( value: 'value03', child: new Text('Item Three')),
          new PopupMenuDivider(height: 1.0),
          new PopupMenuItem<String>( value: 'value04', child: new Text('I am Item Four'))
        ],
      onSelected: (String value){
        setState(() {
          _bodyStr = value;
        });
      },
    );

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget buttomBtn = new Container(
      padding: new EdgeInsets.all(20.0),
      child: new RaisedButton(
          child: new Text(
            '弹出下拉菜单',
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blue,
          onPressed: () async {


            final result = await showMenu(
                context: context,
                position: RelativeRect.fromLTRB(100,200, 100, 100),
                items: <PopupMenuEntry<String>>[
                    new PopupMenuItem<String>( value: 'value01', child: new Text('Item One')),
                    new PopupMenuItem<String>( value: 'value02', child: new Text('Item Two')),
                    new PopupMenuItem<String>( value: 'value03', child: new Text('Item Three')),
                    new PopupMenuItem<String>( value: 'value04', child: new Text('I am Item Four')),
                    new PopupMenuItem<String>( value: 'value01', child: new Text('Item One')),
                    new PopupMenuDivider(height: 1.0),
                    new PopupMenuItem<String>( value: 'value02', child: new Text('Item Two')),
                    new PopupMenuDivider(height: 1.0),
                    new PopupMenuItem<String>( value: 'value03', child: new Text('Item Three')),
                    new PopupMenuDivider(height: 1.0),
                    new PopupMenuItem<String>( value: 'value04', child: new Text('I am Item Four'))
                  ]);
          }),
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('控件学习'),
        actions: <Widget>[
//          _NomalPopMenu()
        _DeviderPopMenu()
        ],

      ),
      body: new ListView(
        padding: const EdgeInsets.all(15.0),
        children: <Widget>[
          new Text(_bodyStr,
          textAlign: TextAlign.center,),
          buttomBtn,
        ],
      ),

    );
  }



}