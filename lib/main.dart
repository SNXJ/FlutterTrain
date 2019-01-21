import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_first/pages/HomePage.dart';
import 'package:flutter_first/pages/MinePage.dart';
import 'package:flutter_first/pages/TempPage.dart';
import 'package:flutter_first/pages/TrainDemoPage.dart';

void main() => runApp(MyTrainClient());

class MyTrainClient extends StatefulWidget {
  @override
  _TrainState createState() => new _TrainState();
}

class _TrainState extends State<MyTrainClient> {
  var tabText = ["首页", "持仓", "行情", "发现", "我的"];
  var tabIcon;
  var _currentIndex = 4;
  var _body;

  Image _getTabImage(name) => new Image.asset(
        "images/" + name + ".png",
        width: 22,
        height: 22,
      );

  TextStyle normalStyle = new TextStyle(
    color: const Color(0xff333333),
    fontSize: 12,
  );

  TextStyle preStyle = new TextStyle(
    color: const Color(0xffED394D),
    fontSize: 12,
  );

  Text _getTabText(index) => new Text(
        tabText[index],
        style: index == _currentIndex ? preStyle : normalStyle,
      );

  Image _getTabIcon(index) =>
      index == _currentIndex ? tabIcon[index][1] : tabIcon[index][0];

  void _initData() {
    if (null == tabIcon) {
      tabIcon = [
        [_getTabImage("home"), _getTabImage("home_pre")],
        [_getTabImage("order"), _getTabImage("order_pre")],
        [_getTabImage("market"), _getTabImage("market_pre")],
        [_getTabImage("find"), _getTabImage("find_pre")],
        [_getTabImage("mine"), _getTabImage("mine_pre")],
      ];
    }

    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(tabText[0]),
        new TempPage(tabText[1]),
        new TempPage(tabText[2]),
        new TrainDemoPage(),
        new MinePage(tabText[4]),
      ],
      index: _currentIndex,
    );
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

      home: new Scaffold(
        appBar: (_currentIndex != 3
            ? new AppBar(
                title: new Center(
                  child: new Text(
                    tabText[_currentIndex],
                    style: new TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              )
            : null),
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: _getTabIcon(0),
              title: _getTabText(0),
            ),
            new BottomNavigationBarItem(
              icon: _getTabIcon(1),
              title: _getTabText(1),
            ),
            new BottomNavigationBarItem(
              icon: _getTabIcon(2),
              title: _getTabText(2),
            ),
            new BottomNavigationBarItem(
              icon: _getTabIcon(3),
              title: _getTabText(3),
            ),
            new BottomNavigationBarItem(
              icon: _getTabIcon(4),
              title: _getTabText(4),
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
//        drawer: new ,
      ),
    );
  }
}
