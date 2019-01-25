import 'package:flutter/material.dart';
//未使用
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
    return new Scaffold(
      body: new Center(
        child: Text(title),
      ),
    );
  }

  _HangListPageState(this.title);
}
