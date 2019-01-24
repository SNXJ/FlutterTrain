import 'package:flutter/material.dart';
import 'package:flutter_first/Utils/DialogUtil.dart';
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
  var text1 = ['积分商城', '快速了解', '在线客服', '分享领券'];
  var text2 = ['版本检测', '帮助信息', '关于我们'];
  var images1 = [
    'images/mine_integral.png',
    'images/mine_know.png',
    'images/mine_service.png',
    'images/mine_share.png',
  ];

  _initData() async {
    userName = await SpUtil.get(Constant.USER_NAME);
    userID = await SpUtil.get(Constant.USER_ID);
    userPhone = await SpUtil.get(Constant.USER_PHONE);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF0F1F3),
      body: new ListView.separated(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _getInfoLayout(context, 0);
            } else if (index == 1) {
              return _getMiddleLayout(context, 1);
            } else {
              return _getBottomItem(context, index - 2);
            }
          },
          separatorBuilder: (BuildContext context, int index) {
            return index == 1
                ? Container(
                    height: 5,
                    color: Color(0xFFF0F1F3),
                  )
                : new Divider(
                    height: 1,
                    color: Colors.grey,
                  );
          }),
    );
  }

  _getInfoLayout(BuildContext context, int index) {
    return new GestureDetector(
      child: new Container(
        color: Colors.blue,
        height: 160,
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  backgroundImage: (userID == null)
                      ? AssetImage("images/head_def.png")
                      : AssetImage("images/head_done.png"),
//                        width: 80,
                  radius: 90,
                ),
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
        userID == null ? _gotoLogin(context) : _goLoginOut();
      },
    );
  }

  _getMiddleLayout(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          _getMiddleItem(context, 0),
          _getMiddleItem(context, 1),
          _getMiddleItem(context, 2),
          _getMiddleItem(context, 3),
        ],
      ),
    );
  }

  _getMiddleItem(BuildContext context, int index) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(images1[index]),
              width: 40,
            ),
            Container(
              height: index == 0 ? 12 : 8,
            ),
            Text(
              text1[index],
              style: new TextStyle(fontSize: 14, color: Colors.blue),
            )
          ],
        ),
        onTap: () {
          print("======${text1[index]}========");
          _isLogin(context);
        },
      ),
    );
  }

  _isLogin(BuildContext context) async {
    var id = await SpUtil.get(Constant.USER_ID);
    if (null == id) {
      DialogUtil.showMsgDialog(context, "请先登录");
    }else{
      DialogUtil.showToastDialog(context, "敬请期待...");
    }
  }

  _getBottomItem(BuildContext context, int index) {
    return GestureDetector(
      child: new Container(
        color: Colors.white,
        child: new Padding(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  text2[index],
                  style: new TextStyle(fontSize: 14, color: Colors.blue),
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ),
      onTap: () {
        _isLogin(context);

      },
    );
  }

  _gotoLogin(context) async {
    User res = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) {
      return new LoginPage("登录");
    }));

    if (res != null) {
      setState(() {
        _initData();
      });
    }
  }

  _MinePageState(this.title);

  _goLoginOut() async {
    var res = await Navigator.of(context)
        .push(new MaterialPageRoute(builder: (context) {
      return new LogOutPage("退出");
    }));

    if (res != null) {
      setState(() {
        _initData();
      });
    }
  }
}
