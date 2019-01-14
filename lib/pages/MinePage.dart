import 'package:flutter/material.dart';
import 'package:flutter_first/pages/LoginPage.dart';

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
        child: Column(
          children: <Widget>[
            new GestureDetector(
              child: new Container(
                color: Colors.blue,
                height: 200,
                child: new Center(
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage("images/avatar.png"),
                        width: 80,
                      ),
                      Container(height: 10,),
                      Text(
                        "点击登录",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {
//                print("登录点击+++++++++++++++++++++++++++++++++");
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return new LoginPage("登录");
                }));
              },
            )
          ],
        ),
      ),
    );
  }

  _MinePageState(this.title);
}
