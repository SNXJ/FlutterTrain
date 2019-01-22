import 'package:flutter/material.dart';
import 'package:flutter_first/pages/DiscoverMallPage.dart';

class DiscoverPage extends StatefulWidget {
  String title;

  DiscoverPage(this.title);

  @override
  _DiscoverPageState createState() => new _DiscoverPageState(title);
}

class _DiscoverPageState extends State<DiscoverPage> {
  var tabText = ["我的圈子", "学习专区", "积分商城"];
  String title;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar:
        new AppBar(
          title: new TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor:Color(0xFF999999),
              labelStyle: new TextStyle(fontSize: 15),
              unselectedLabelStyle: new TextStyle(fontSize: 14),
              tabs: [
                new Tab(text: tabText[0]),
                new Tab(text: tabText[1]),
                new Tab(text: tabText[2]),
              ]),
        ),
        body: new TabBarView(children: [
          new DiscoverMallPage(tabText[0]),
          new DiscoverMallPage(tabText[1]),
          new DiscoverMallPage(tabText[2]),
        ]),
      ),
    );
  }

  _DiscoverPageState(this.title);
}
