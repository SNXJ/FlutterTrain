import 'package:flutter/material.dart';
import 'package:flutter_first/net/NetManger.dart';

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

  _login(BuildContext context) {
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
    print("++++++++++++++++登录成功");
    //TODO login
//    Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("登录成功")));

  new NetManger().instance();

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
