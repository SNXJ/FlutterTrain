import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => new _HomePageState(title);
}

class _HomePageState extends State<HomePage> {
  String title;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      title: "myapp",
      home: new Scaffold(
        appBar: new AppBar(
          title: Text(title),
        ),
        body: new Center(
          child: Text(title),
        ),
      ),
    );
  }

  _HomePageState(this.title);


}
