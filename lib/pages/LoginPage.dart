import 'package:flutter/material.dart';
import 'package:flutter_first/dao/UserDao.dart';
import 'package:flutter_first/models/ResultModel.dart';
import 'package:flutter_first/models/User.dart';
import 'package:flutter_first/models/UserInfo.dart';
import 'package:flutter_first/net/API.dart';
import 'package:flutter_first/net/NetManger.dart';

class LoginPage extends StatefulWidget {
  String title;

  LoginPage(this.title);

  @override
  _LoginPageState createState() => new _LoginPageState(title);
}

class _LoginPageState extends State<LoginPage> {
  static Map mapInner = {
    "mobile": "18141906652",
    "password": "0000",
    "push_id": "100d855909689602a27"
  };

  Map mapOuter = {
    "client_id": "7",
    "token": "xxxxxx",
    "user_id": "0",
    "uuid": "1545708413075-9099610000-7074710000",
    "version": "1.0.1",
    "app_id": "6",
    "data": mapInner
  };

  String title;

  TextEditingController userController = new TextEditingController(text: "");
  TextEditingController pwdController = new TextEditingController(text: "");

  _login(BuildContext context) async {
    String userName = userController.text.trim();
    String pwd = pwdController.text.trim();
//    print("$userName+++login++$pwd");
    if (userName.isEmpty || pwd.isEmpty) {
      print("++++++++++++账号或密码不能为空");
//      Scaffold.of(context)
//          .showSnackBar(new SnackBar(content: new Text("账号或密码不能为空")));//Scaffold原因无效
//
      return;
    }
    //TODO login
    var response = await NetManger.doPost(Api.LOGIN_URL, mapOuter);
    if(null!=response){

    UserInfo userInfo = UserInfo.fromMap(response);

    if (userInfo != null) {
      print("++++++++++++++++res=====" + userInfo.data.nickname.toString());
    } else {
      print("++++++++++++++++res=====null");
    }

    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录"),
      ),
      body: new Container(
        padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
        child: Column(
          children: <Widget>[
            new TextField(
              maxLength: 11,
              maxLines: 1,
              controller: userController,
              decoration: new InputDecoration(
                prefixIcon: Icon(Icons.phone_android),
                hintText: "请输入用户名",
                hintStyle: new TextStyle(color: const Color(0xFF808080)),
                border: new OutlineInputBorder(
                    borderSide: BorderSide(width: 0.5), //没用
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(6.0))),
                contentPadding: const EdgeInsets.all(10.0),
              ),
            ),
            new TextField(
              maxLength: 20,
              maxLines: 1,
              controller: pwdController,
              obscureText: true,
              decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.lock),

//                  suffixIcon: Icon(Icons.remove_red_eye),
                  hintText: "请输入密码",
                  hintStyle: new TextStyle(color: const Color(0xFF808080)),
                  border: new OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(6.0)),
                  ),
                  contentPadding: const EdgeInsets.all(10.0)),
            ),

//
            RaisedButton(
              padding:
                  EdgeInsets.only(top: 13, bottom: 13, left: 100, right: 100),
              color: Colors.blue,
              child: Text(
                "点击登录",
                style: new TextStyle(),
              ),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
              onPressed: () {
                _login(context);
              },
            )
          ],
        ),
      ),
    );
  }

  _LoginPageState(this.title);
}
