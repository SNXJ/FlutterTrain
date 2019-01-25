import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/pages/HangListPage.dart';

class ListViewTestPage extends StatefulWidget {
  String title;

  ListViewTestPage(this.title);

  @override
  _HangOrderPageState createState() => new _HangOrderPageState(title);
}

class _HangOrderPageState extends State<ListViewTestPage> {
  List tabText = ["红酒22", "国际黄金", "美国原油", "上海期货", "全球股指", "外汇", "LEM金属", "深石油"];

//  List tabText = ["红酒", "国际黄金", "美国原油", "上海期货", "全球股指",];
  String title;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length:  tabText.length,
      child: Scaffold(
        appBar: new AppBar(
          title: new TabBar(
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xFF999999),
            labelStyle: new TextStyle(fontSize: 15),
            unselectedLabelStyle: new TextStyle(fontSize: 14),
            tabs: _getTab(),
//            controller:  _tabController,
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              var isRed=((index%2==0)?true:false);
              return new ListTile(
                onTap: (){

                },
                selected: true,
                dense: true,
                contentPadding: EdgeInsets.all(10),
                leading: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      "法国波尔多",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    new Container(height: 5,width: 10,),
                    new Text(
                      "YGWS",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                title: new Center(
                  child: new Text(
                    "1333",
                    style: TextStyle(fontSize: 16, color: isRed?Colors.red:Colors.green),
                  ),
                ),
                trailing: new Container(
                  height: 30,
                  width: 75,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                     color: isRed?Colors.red:Colors.green,
                    onPressed: () => {},
                    child: new Text(
                      "-0.66%",
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => new Divider(
                  height: 1,
                ),
            itemCount: 4),
      ),
    );
//
  }

  _getTab() {
    List<Widget> tabs = [];
    for (var item in tabText) {
      tabs.add(
        Tab(
          text: item,
        ),
      );
    }
    return tabs;
  }

  _HangOrderPageState(this.title);
}
