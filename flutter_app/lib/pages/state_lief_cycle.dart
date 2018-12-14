import 'package:flutter/material.dart';

/*
* State生命周期详解
* */
class StateLiefCycle extends StatefulWidget{
  const StateLiefCycle({
  Key key,
  this.initValue:0
  }):super(key:key);

  final int initValue;

  @override
  _StateLiefCycleState createState() => new _StateLiefCycleState();

}

class _StateLiefCycleState extends State<StateLiefCycle>{
  int _counter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _counter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print('build');
    return Center(
      child: FlatButton(
        textColor: Colors.white,
        color: Colors.orange,
        child: Text('$_counter',textAlign: TextAlign.center,),
        onPressed:()=>setState(()=> ++_counter),
      ),
    );
  }

  @override
  void didUpdateWidget(StateLiefCycle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }


  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print('reassemble');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

}


Widget build(BuildContext context){
//  return StateLiefCycle();
  return Text('xxx');
}


