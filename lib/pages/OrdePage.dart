import 'package:flutter/material.dart';
import 'package:flutter_first/pages/DiscoverLearnPage.dart';
import 'package:flutter_first/pages/DiscoverMallPage.dart';
import 'package:flutter_first/pages/OrdeTradPage.dart';
///订购
class OrderPage extends StatefulWidget {
  String title;

  OrderPage();

  @override
  _OrderPagePageState createState() => new _OrderPagePageState(title);
}

class _OrderPagePageState extends State<OrderPage> {
  var tabText = ["买卖", "订单","约购", "交易","资金",];
  String title;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: tabText.length,
      child: Scaffold(
        appBar: new AppBar(
          title: new TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Color(0xFF999999),
              labelStyle: new TextStyle(fontSize: 15),
              unselectedLabelStyle: new TextStyle(fontSize: 14),
              tabs: [
                new Tab(text: tabText[0]),
                new Tab(text: tabText[1]),
                new Tab(text: tabText[2]),
                new Tab(text: tabText[3]),
                new Tab(text: tabText[4]),
              ]),
        ),
        body: new TabBarView(
          children: [
          new  OrdeTradPage(""),
          new  OrdeTradPage(""),
          new  OrdeTradPage(""),
          new  OrdeTradPage(""),
          new  OrdeTradPage(""),

          ],
        ),
      ),
    );
  }

//

  _OrderPagePageState(this.title);
}
