import 'package:flutter/material.dart';
import 'package:flutter_first/Utils/DialogUtil.dart';
import 'package:flutter_first/Utils/SpUtil.dart';
import 'package:flutter_first/Utils/UserUtil.dart';
import 'package:flutter_first/dao/UserDao.dart';
import 'package:flutter_first/models/ErrorMsg.dart';
import 'package:flutter_first/models/UserInfo.dart';
import 'package:flutter_first/net/Api.dart';
import 'package:flutter_first/net/Constant.dart';

class LogOutPage extends StatefulWidget {
  String title;

  LogOutPage(this.title);

  @override
  _LogOutPageState createState() => new _LogOutPageState(title);
}

class _LogOutPageState extends State<LogOutPage> {
  String title;

  TextEditingController userController = new TextEditingController(text: "");
  TextEditingController pwdController = new TextEditingController(text: "");

  _logOut(BuildContext context) async {
    Map logOutMap = await Constant.getLogOutMap();

    ErrorMsg msg = await UserDao.logOut(context, Api.LOGOUT_URL, logOutMap);

    if (msg != null) {
      UserUtil.clearUser();
      print("=======退出成功=======");
//      DialogUtil.showToastDialog(context, msg.message.toString());
      Navigator.pop(context, "退出登录");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("退出登录"),
      ),
      body: new GestureDetector(
        onTap: ()=>_logOut(context),

        child: new Container(
          
          margin: const EdgeInsets.only(top: 60, left: 30, right: 30),
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.blue,
          ),
          child: Text(
            "退出登录",
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _LogOutPageState(this.title);
}
