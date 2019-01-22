import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  String title;

  DiscoverPage(this.title);

  @override
  _DiscoverPageState createState() => new _DiscoverPageState(title);
}

class _DiscoverPageState extends State<DiscoverPage> {
  String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//        appBar: new AppBar(
//          title: Text(title),
//        ),
      body: new Center(
        child: Text(title),
      ),
    );
  }

  _DiscoverPageState(this.title);
}
