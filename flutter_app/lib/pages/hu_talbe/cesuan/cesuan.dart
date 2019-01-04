import 'package:flutter/material.dart';
import 'package:flutter_section_table_view/flutter_section_table_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class CesuanPage extends StatefulWidget{
  @override
  CesuanPageState createState() => new CesuanPageState();
}


class CesuanPageState extends State<CesuanPage>{

  double tableRowHight = 55.0;
  String cellMessage = '好听的歌dadsfasdkfjfladsfafadfadfadfadfadddf大发觉得饭卡君';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void clickedRaisedButton(){
    print('时间按钮');
  }

  int sectionCount = 3;
  final controller = SectionTableController(sectionTableViewScrollTo: (section, row, isScrollDown) {
    print('received scroll to $section $row scrollDown:$isScrollDown');
  });
  final refreshController = RefreshController();

  Indicator refreshHeaderBuilder(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      releaseText: '释放以刷新',
      refreshingText: '刷新中...',
      completeText: '完成',
      failedText: '失败',
      idleText: '下拉以刷新',
      noDataText: '',
    );
  }

  Indicator refreshFooterBuilder(BuildContext context, int mode) {
    return ClassicIndicator(
      mode: mode,
      releaseText: '释放以加载',
      refreshingText: '加载中...',
      completeText: '加载完成',
      failedText: '加载失败',
      idleText: '上拉以加载',
      noDataText: '',
      idleIcon: const Icon(Icons.arrow_upward, color: Colors.grey),
      releaseIcon: const Icon(Icons.arrow_downward, color: Colors.grey),
    );
  }


  Center RingSubInfo(int type,int num){
      return new Center(
          child: GestureDetector(
            child:  new Row(
              children: <Widget>[
                  new Icon(Icons.timer,size: 14.0),
                  new Text(num.toString(),style: new TextStyle(fontSize: 12.0)),
              ],
            ),
          ),
      );
  }


  Row buildRingCell(int Index,String title,String subTitle,int timeSecond,int fans,int reply){
    Color color = Theme.of(context).primaryColor;
    print('${ScreenUtil.screenWidth}, ${ScreenUtil.screenWidthDp},${ScreenUtil().setWidth(750)}');
    Offstage buildIndex(){
        if (Index == 1){
          return new Offstage(
             offstage: false,
              child:  new Icon(Icons.play_arrow)
          );
        }else if(Index == 2){
          return new Offstage(
              offstage: false,
            child: new Text(Index.toString()),
          );
        }else {
          return new Offstage(
            offstage: false,
            child:  new Icon(Icons.pause),
          );
        }
    }

    return new Row(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
           new Container(
             child:buildIndex(),
             width: 30,
             height: 30,
           ),
           new Container(
             width: ScreenUtil().setWidth(750) - 30,
             margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
             child: new Column(
               children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        height:38,
                        width: ScreenUtil().setWidth(750) - 30,
                        child: new Text(title,
                          style: new TextStyle(fontSize: 15.0,color: Colors.black),
                          textAlign: TextAlign.left,
                          softWrap: true,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Expanded(flex:2,child:new Text(subTitle,style: new TextStyle(fontSize: 12.0,color: Colors.grey),textAlign: TextAlign.left,),),
                      new Expanded(child:RingSubInfo(1, 200), ),
                      new Expanded(child:RingSubInfo(1, 200), ),
                      new Expanded(child:RingSubInfo(1, 200), ),
                     ],
                  ),
             ],
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('界面2'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Top'),Icon(Icons.keyboard_arrow_down)
            ],
          ),
          onPressed: (){
            controller.animateTo(2, -1).then((complete){
               print('animated $complete');
               cellMessage = 'jdfakjdfajdkafjk';
            });
          }
      ),
      body: SafeArea(
        child: SectionTableView(
          refreshHeaderBuilder: refreshHeaderBuilder,
          refreshFooterBuilder: refreshFooterBuilder,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: (up) {
            print('on refresh $up');

            Future.delayed(const Duration(milliseconds: 2009)).then((val) {
              refreshController.sendBack(up, RefreshStatus.completed);
              setState(() {
                if (up) {
                  sectionCount = 3;
                } else {
                  sectionCount++;
                }
              });
            });
          },
            refreshController: refreshController,
            sectionCount: sectionCount,
            numOfRowInSection: (section){
              return 2;
            },
            cellAtIndexPath: (section,row){
               return Container(
                 height: tableRowHight,
                 child: Center(
                    child: buildRingCell(row, cellMessage, '正常野人', 24, 709, 100),
                  ),
               );
            },
            headerInSection: (section){
              return Container(
                 height: 40,
                 padding: EdgeInsets.all(10),
                 color: Colors.orange,
                 child: Text('Header $section'),
              );
            },

            divider: Container(
               color: Colors.grey,
               height: 0.5,
            ),
            controller: controller,
            sectionHeaderHeight: (section) => 44.0,
            dividerHeight: () => 0.5,
            cellHeightAtIndexPath: (section, row) => tableRowHight,
       ),
      ),
    );
  }
}
