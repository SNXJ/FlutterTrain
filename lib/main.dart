import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyTrainClient());

class MyTrainClient extends StatefulWidget {
  @override
  _TrainState createState() => new _TrainState();
}

class _TrainState extends State<MyTrainClient> {
  Image _getTabImage(name) => new Image.asset(
        "images/" + name + ".png",
        width: 20,
        height: 20,
      );

  var tabText = ["首页", "持仓", "行情", "发现", "我的"];
  var tabIcon;

  void _initData() {
    if (null == tabIcon) {
      tabIcon = [
        [_getTabImage("home"), _getTabImage("home_pre")],
        [_getTabImage("order"), _getTabImage("order_pre")],
        [_getTabImage("market"), _getTabImage("market_pre")],
        [_getTabImage("find"), _getTabImage("find_pre")],
        [_getTabImage("mine"), _getTabImage("imine_pre")],
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    _initData();

    return new MaterialApp(
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
      ),

//
      home: new Scaffold(
        appBar: new AppBar(
          title: Text("appbar"),
        ),
        body: new Center(
          child: Text("center"),
        ),
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: tabIcon[0][0],
            ),
            new BottomNavigationBarItem(
              icon: tabIcon[1][0],
            ),
            new BottomNavigationBarItem(
              icon: tabIcon[2][0],
            ),
            new BottomNavigationBarItem(
              icon: tabIcon[3][0],
            ),
            new BottomNavigationBarItem(
              icon: tabIcon[4][0],
            ),
          ],
        ),
      ),
    );
  }
}
