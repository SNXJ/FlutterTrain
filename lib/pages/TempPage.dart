import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  String title;

  TempPage(this.title);

  @override
  _TempPageState createState() => new _TempPageState(title);
}

class _TempPageState extends State<TempPage> {
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

  _TempPageState(this.title);


}
