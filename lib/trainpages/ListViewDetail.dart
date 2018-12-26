import 'package:flutter/material.dart';

class ListViewDetail extends StatelessWidget {
  ListViewDetail(this.str);

  final String str;

//  ListViewDetail({Key key, String str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("$str"),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: Center(
          child: new RaisedButton(child: Text("返回"), onPressed: () {
            Navigator.pop(context,"返回来的值");

          }),
        ),
      ),
    );
  }
}
