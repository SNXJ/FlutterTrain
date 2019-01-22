import 'package:flutter/material.dart';

class DiscoverMallPage extends StatefulWidget {
  String title;

  DiscoverMallPage(this.title);

  @override
  _DiscoverMallState createState() => new _DiscoverMallState(title);
}

class _DiscoverMallState extends State<DiscoverMallPage> {
  String title;

  @override
  Widget build(BuildContext context) {
//      title: "myapp",
    return new Scaffold(
//        appBar: new AppBar(
//          title: Text(title),
//        ),
      body: new Center(
        child: Text(title),
      ),
    );
  }

  _DiscoverMallState(this.title);
}
