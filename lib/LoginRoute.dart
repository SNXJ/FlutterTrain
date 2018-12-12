import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  TextEditingController _loginController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _loginController.text = "哈哈此处测试";
    _loginController.selection = TextSelection(
        baseOffset: 2, extentOffset: _loginController.text.length);
    _loginController.addListener(() {
      print("controller:" + _loginController.text);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("LoginRoute"),
      ),
      body: Center(
//        child: Text("this is a new route and tip=$tip"),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(46),
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.search,
                  controller: _loginController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "手机号邮箱",
                      prefixIcon: Icon((Icons.person))),
                  onChanged: (v) {
                    print("用户名：$v");
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "登录密码",
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  LoginRoute(this.tip);

  final String tip;
}
