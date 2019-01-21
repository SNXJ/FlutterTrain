import 'package:flutter/material.dart';
import 'package:flutter_first/Utils/SpUtil.dart';
import 'package:flutter_first/models/User.dart';
import 'package:flutter_first/net/Constant.dart';
import 'package:flutter_first/pages/LogOutPage.dart';
import 'package:flutter_first/pages/LoginPage.dart';

class MinePage extends StatefulWidget {
  String title;

  MinePage(this.title);

  @override
  _MinePageState createState() => new _MinePageState(title);
}

class _MinePageState extends State<MinePage> {
  String title;
  String userName;
  String userPhone;
  String userID;

  _initData()  {
    userName =  SpUtil.get(Constant.USER_NAME);
    userID =  SpUtil.get(Constant.USER_ID);
    userPhone =  SpUtil.get(Constant.USER_PHONE);
  }

  @override
  Widget build(BuildContext context) {

    _initData();
    print("++++++++$userPhone+++++++++");

    return new Scaffold(
//
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
                        image: (userID == null)
                            ? AssetImage("images/head_def.png")
                            : AssetImage("images/head_done.png"),
                        width: 80,
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        userName != null ? userName : "点击登录",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        userPhone != null ? userPhone : "",
                        style: new TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
               userID==null? _gotoLogin(context):_goLoginOut();
              },
            )
          ],
        ),
      ),
    );
  }

  _gotoLogin(context) async {
    User res = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) {
      return new LoginPage("登录");
    }));

    if (res != null) {
      setState(() {

      });
    }
  }

  _MinePageState(this.title);

  _goLoginOut() async {
    User res = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) {
      return new LogOutPage("退出");
    }));

    if (res != null) {
      setState(() {

      });
    }


  }
}
