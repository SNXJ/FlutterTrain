import 'package:flutter/material.dart';
import 'package:flutter_first/pages/DiscoverMallPage.dart';
import 'package:flutter_first/pages/HangListPage.dart';

class HangOrderPage extends StatefulWidget {
  String title;

  HangOrderPage(this.title);

  @override
  _HangListPageState createState() => new _HangListPageState(title);
}

class _HangListPageState extends State<HangOrderPage> {
  var tabText = ["红酒", "国际黄金", "美国原油", "上海期货", "全球股指", "外汇", "LEM金属", "深石油"];
  String title;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new AppBar(
          title: new TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xFF999999),
              labelStyle: new TextStyle(fontSize: 15),
              unselectedLabelStyle: new TextStyle(fontSize: 14),
              tabs:_getTab(),

//              [
//
//
//                new Tab(text: tabText[0]),
//                new Tab(text: tabText[1]),
//                new Tab(text: tabText[2]),
//              ]
 ),
        ),
        body: new TabBarView(children: [
          new HangListPage(tabText[0]),
          new HangListPage(tabText[1]),
          new HangListPage(tabText[2]),
        ]),
      ),
    );
  }

  _getTab(){
    var tabs=[];
    for( var item in tabText){

      tabs.add(new Tab(text: item,));
    }
    return tabs;
  }

  _HangListPageState(this.title);
}
