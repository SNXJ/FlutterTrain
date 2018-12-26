import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  String title;

  MinePage(this.title);

  @override
  _MinePageState createState() => new _MinePageState(title);
}

class _MinePageState extends State<MinePage> {
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

  _MinePageState(this.title);


}
