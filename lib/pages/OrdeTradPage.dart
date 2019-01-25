import 'package:flutter/material.dart';

///订购-买卖
class OrdeTradPage extends StatefulWidget {
  String title;

  OrdeTradPage(this.title);

  @override
  _OrdeTradPageState createState() => new _OrdeTradPageState(title);
}

class _OrdeTradPageState extends State<OrdeTradPage> {
  String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF0F1F3),
      body: new Container(
        color: Color(0xFFF0F1F3),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return _getItem();
            },
            separatorBuilder: (context, index) => new Container(
                  height: 10,
//                  color: Color(0xFFF0F1F3),
                ),
            itemCount: 2),
      ),
    );
  }

  _OrdeTradPageState(this.title);

  Widget _getItem() {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Text("英国威士忌",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                )),
            title: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text("1310.8 ",
                    style: TextStyle(fontSize: 17, color: Colors.red)),
                new Text(" +5.5 ",
                    style: TextStyle(fontSize: 12, color: Colors.red)),
                new Text(" +0.56%",
                    style: TextStyle(fontSize: 12, color: Colors.red)),
              ],
            ),
            trailing: Icon(
              Icons.navigate_next,
              color: Colors.blue,
            ),
            contentPadding: EdgeInsets.only(left: 15, right: 15),
            dense: true,
          ),
          new Divider(
            height: 1,
          ),
          Container(
            height: 10,
          ),
          _getMiddle(),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new Center(
                  child: new Text("52%买涨",
                      style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Center(
                  child: new Text("48%买跌",
                      style: TextStyle(fontSize: 12, color: Color(0xFF999999))),
                ),
              )
            ],
          ),
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: new Padding(
                  padding: EdgeInsets.only(left: 30, right: 15),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    color: Colors.red,
                    child: new Text("追涨购",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: new Padding(
                  padding: EdgeInsets.only(left: 15, right: 30),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onPressed: () {},
                    color: Colors.green,
                    child: new Text("保价购",
                        style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _getMiddle() {
    return new Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 15, right: 5, bottom: 5),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xffeeeeee),
              border: Border.all(color: Colors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(3),
            ),
//            color: Color(0xffeeeeee),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "英国威士忌",
                  style: TextStyle(fontSize: 16, color: Color(0xff333333)),
                ),
                new Container(
                  height: 5,
                ),
                new Text(
                  "6",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
                new Container(
                  height: 5,
                ),
                new Text(
                  "元/手",
                  style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 5, bottom: 5),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffeeeeee), width: 1.0),
              borderRadius: BorderRadius.circular(3),
            ),
//            color: Color(0xffeeeeee),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "法国波尔多",
                  style: TextStyle(fontSize: 16, color: Color(0xff333333)),
                ),
                new Container(
                  height: 5,
                ),
                new Text(
                  "60",
                  style: TextStyle(fontSize: 24, color: Colors.blue),
                ),
                new Container(
                  height: 5,
                ),
                new Text(
                  "元/手",
                  style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 5, right: 15, bottom: 5),
            padding: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xffeeeeee), width: 1.0),
              borderRadius: BorderRadius.circular(3),
            ),
//            color: Color(0xffeeeeee),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "新疆吐鲁番",
                  style: TextStyle(fontSize: 16, color: Color(0xff333333)),
                ),
                new Container(
                  height: 5,
                ),
                new Text(
                  "360",
                  style: TextStyle(fontSize: 26, color: Colors.blue),
                ),
                new Container(
                  height: 5,
                ),
                new Text(
                  "元/手",
                  style: TextStyle(fontSize: 12, color: Color(0xff999999)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
