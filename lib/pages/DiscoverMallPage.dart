import 'package:flutter/material.dart';
import 'package:flutter_first/Utils/DialogUtil.dart';

class DiscoverMallPage extends StatefulWidget {
  String title;

  DiscoverMallPage(this.title);

  @override
  _DiscoverMallState createState() => new _DiscoverMallState(title);
}

class _DiscoverMallState extends State<DiscoverMallPage> {
  String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFFF0F1F3),
        body: ListView.separated(
          itemCount: 4,
          itemBuilder: (context, index) {
            if (index == 0) {
              return _getItemTop();
            } else {
              return _getItem(context, index);
            }
          },
          separatorBuilder: (context, index) => Divider(height: 1),
        ));
  }

  _DiscoverMallState(this.title);

  _getItem(context, index) {
    return GestureDetector(
      onTap: () {
        print("====${index}===");
        DialogUtil.showToastDialog(context, "点击第${index}项");
      },
      child: Container(
        color: Colors.white,
        height: 80,
        child: Padding(
          padding: EdgeInsets.only(top: 8, bottom: 5, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  width: 80,
                  height: 80,
                  child: Center(
                    child: Text(
                      "¥ 60",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "商城代金券",
                    style: new TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    height: 5,
                  ),
                  new Text(
                    "600积分",
                    style: new TextStyle(
                      fontSize: 14,
                      color: Color(0xffff6c00),
                    ),
                  ),
                ],
              ),
              Expanded(child: new Text("")),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "0人兑换",
                    style: new TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                    ),
                  ),
                  Container(
                    height: 8,
                  ),
                  Container(
                    height: 25,
                    width: 80,
                    child: OutlineButton(
                      onPressed: () {
                        DialogUtil.showToastDialog(context, "马上兑换");
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 0.5,
                      ),
                      child: new Text(
                        "马上兑换",
                        style: new TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
//
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getItemTop() {
    return Container(
//      height: 272,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(top: 10, right: 10),
            child: new Stack(

              children: <Widget>[
                new Image(
                  fit:BoxFit.fill,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage("images/integral_card_bg.png"),
                ),
                new Positioned(
                  child: new Container(
                    height: 30,
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            topLeft: Radius.circular(90)),
                      ),
                      onPressed: () {},
                      child: new Text(
                        "积分规则",
                        style: new TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  top: 18,
                  right: -10,
                ),
                new Positioned(
                  child: new Container(
                    height: 30,
                    child: OutlineButton(
                      borderSide: BorderSide(color: Colors.white, width: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            topLeft: Radius.circular(90)),
                      ),
                      onPressed: () {},
                      child: new Text(
                        "查看细则",
                        style: new TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                  top: 58,
                  right: -10,
                ),
                new Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          "我的积分",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          "0000",
                          style:
                              new TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 300,
                        child: Stack(
                          children: <Widget>[
                            Image(
                              image: AssetImage("images/integral_grade_bg.png"),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Text(
                                      "会员等级",
                                      style: new TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  Image(
                                    width: 28,
                                    height: 28,
                                    image:
                                        AssetImage("images/integral_grade.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 0),
                                    child: Text(
                                      "尊享优惠",
                                      style: new TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
//
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Color(0xFFF0F1F3),
//                color: Colors.red,
            height: 50,
            child: Row(
              children: <Widget>[
                Container(
                  height: 30,
                  width: 2,
                  color: Colors.blue,
                ),
                Text(
                  "     积分兑换",
                  style: new TextStyle(color: Colors.blue, fontSize: 16),
                ),
                Expanded(
                  child: Text(
                    "",
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                Text(
                  "兑换历史  ",
                  style: new TextStyle(color: Colors.blue, fontSize: 14),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
