import 'package:flutter/material.dart';

class HangListPage extends StatefulWidget {
  String title;

  HangListPage(this.title);

  @override
  _HangListPageState createState() => new _HangListPageState(title);
}

class _HangListPageState extends State<HangListPage> {
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

  _HangListPageState(this.title);
}
