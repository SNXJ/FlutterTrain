import 'package:flutter/material.dart';
import 'package:flutter_first/Utils/DialogUtil.dart';
import 'package:flutter_first/Utils/UserUtil.dart';
import 'package:flutter_first/dao/UserDao.dart';
import 'package:flutter_first/models/UserInfo.dart';
import 'package:flutter_first/net/Api.dart';
import 'package:flutter_first/net/Constant.dart';

class LoginPage extends StatefulWidget {
  String title;

  LoginPage(this.title);

  @override
  _LoginPageState createState() => new _LoginPageState(title);
}

class _LoginPageState extends State<LoginPage> {
  String title;

  TextEditingController userController = new TextEditingController(text: "");
  TextEditingController pwdController = new TextEditingController(text: "");

  _login(BuildContext context) async {
    String _userName = userController.text.trim();
    String _pwd = pwdController.text.trim();
    if (_userName.isEmpty || _pwd.isEmpty) {
      print("++++++++++++账号或密码不能为空");
      DialogUtil.showToastDialog(context, "账号或密码不能为空");
      return;
    }

    Map mapOuter = await Constant.getOuterMap();

    Map mapInner = {
      "mobile": _userName,
      "password": _pwd,
      "push_id": "100d855909689602a27"
    };

    mapOuter["data"] = mapInner;

    UserInfo userInfo = await UserDao.login(context, Api.LOGIN_URL, mapOuter);

    if (userInfo != null) {
      await UserUtil.setUser(userInfo.data);
//      DialogUtil.showToastDialog(context, "登录成功");
//      String phone = await SpUtil.get(Constant.USER_PHONE);
//      print("++++++++++++++++res=====" + phone);
      Navigator.pop(context, userInfo.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录"),
      ),
      body: SingleChildScrollView(
        child: new Container(
          padding: const EdgeInsets.only(top: 50, left: 30, right: 30),
          child: Column(
            children: <Widget>[
              new Container(
                height: 40,
                child: new TextField(
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
              ),
              Container(
                height: 25,
              ),
              new Container(
                height: 40,
                child: new TextField(
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
              ),
              Container(
                height: 60,
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child: FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "点击登录",
                    style: new TextStyle(),
                  ),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  onPressed: () {
                    _login(context);
                  },
                ),
              ),
              Container(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _LoginPageState(this.title);
}
