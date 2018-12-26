import 'package:flutter/material.dart';
import 'package:flutter_first/trainpages/AnimationRoute.dart';
import 'package:flutter_first/trainpages/CanvasPaintRoute.dart';
import 'package:flutter_first/trainpages/CustomScrollViewRoute.dart';
import 'package:flutter_first/trainpages/ImageRoute.dart';
import 'package:flutter_first/trainpages/InfiniteListView.dart';
import 'package:flutter_first/trainpages/ListViewDetail.dart';//详情
import 'package:flutter_first/trainpages/LoginRoute.dart';
import 'package:flutter_first/trainpages/MixListView.dart';
import 'package:flutter_first/trainpages/ScreenUtilRoute.dart';
import 'package:flutter_first/trainpages/ScrollControllerRoute.dart';
import 'package:flutter_first/trainpages/SimpleGridView.dart';
import 'package:flutter_first/trainpages/SimpleHttp.dart';
import 'package:flutter_first/trainpages/WidgetChangeRoute.dart';


class TrainDemoPage extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
//        primarySwatch: Colors.blue,
      ),
      home: MyTrainDemoPage(title: ' Home Page'),
      routes: {
        "ScreenUtilRoute": (context) => ScreenUtilRoute(),
        "imageRoute": (context) => ImageRoute(),
        "MixListView": (context) => MixListView(),
        "SimpleGirdView": (context) => SimpleGirdView(),
        "new route": (context) => NewRoute("注册"),
        "LoginRoute": (context) => LoginRoute("登陆/注册"),
        "CustomScrollViewRoute": (context) => CustomScrollViewRoute(),
        "ScrollControllerRoute": (context) => ScrollControllerRoute(),
        "InfiniteListView": (context) => InfiniteListView(),
        "WidgetChangeRoute": (context) => WidgetChangeRoute(),
        "AnimationRoute": (context) => AnimationRoute(),
        "SimpleHttp": (context) => SimpleHttp(),
        "CanvasPaintRoute": (context) => CanvasPaintRoute()
//        "ListViewDetail": (context) => ListViewDetail()
      },
    );
  }

  TrainDemoPage();
}

class MyTrainDemoPage extends StatefulWidget {
  MyTrainDemoPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyTrainDemoState createState() => _MyTrainDemoState();
}

class _MyTrainDemoState extends State<MyTrainDemoPage> {
  int _counter = 0;
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
      body: SingleChildScrollView(
//        child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ScreenUtilRoute");
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("屏幕适配")),

            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "imageRoute");
                },
                textColor: Colors.white,
                color: Colors.blue,
                child: Text("图片显示")),
//
//            RaisedButton(
//              child: Text("简单列表"),
//              textColor: Colors.red,
//              onPressed: () {
//                Navigator.pushNamed(context, "new route"); //注册名打开 命名路由
//
////                Navigator.push(context, new MaterialPageRoute(builder: (context){
////                  return new NewRoute("哈哈");
////                }
////                ));
//              },
//            ),

            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "MixListView");
                },
                child: Text("混合列表")),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "SimpleGirdView");
                },
                child: Text("简单GirdView")),

            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "InfiniteListView");
                },
                child: Text("ListView加载")),

            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "CustomScrollViewRoute");
                },
                child: Text("多布局列表")),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "SimpleHttp");
                },
                child: Text("简单网络请求")),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "ScrollControllerRoute");
                },
                child: Text("ScrollControllerRoute")),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "WidgetChangeRoute");
                },
                child: Text("WidgetChangeRoute")),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "AnimationRoute");
                },
                child: Text("AnimationRoute")),
            RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "CanvasPaintRoute");
                },
                child: Text("CanvasPaintRoute")),

            RaisedButton(
              child: Text("登陆/注册"),
              textColor: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, "LoginRoute"); //注册名打开 命名路由

//                Navigator.push(context, new MaterialPageRoute(builder: (context){
//                  return new NewRoute("哈哈");
//                }
//                ));
              },
            ),

            //Text
            Text(
              "text demo",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontFamily: "Courier",
                  background: new Paint()..color = Colors.yellow,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),

//TextSpan
            Text.rich(TextSpan(children: [
              TextSpan(text: "textSpan网址："),
              TextSpan(
                text: "www.baidu.com",
                style: TextStyle(color: Colors.green),
//              recognizer:_MyHomePageState
              ),
            ])),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//Button
                RaisedButton(
                  child: Text("RaisedButton"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () => {},
                ),
                FlatButton(
                  child: Text("FlatButton"),
                  color: Colors.blue,
                  onPressed: () => {},
                ),
                OutlineButton(
                  child: Text("OutlineButton"),
                  onPressed: () => {},
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () => {},
                ),
                FlatButton(
                  color: Colors.blue,
                  highlightColor: Colors.blue[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.red,
                  child: Text("自定义"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () => {},
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: _switchSelected, //当前状态
                  activeColor: Colors.green,
                  onChanged: (value) {
                    //重新构建页面
                    setState(() {
                      _switchSelected = value;
                    });
                  },
                ),
                Checkbox(
                  value: _checkboxSelected,
                  activeColor: Colors.blue, //选中时的颜色
                  onChanged: (value) {
                    setState(() {
                      _checkboxSelected = value;
                    });
                  },
                ),
              ],
            ),

            Text(
              'You have pushed the button this many times:',
              style: TextStyle(
                height: 3,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
//      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new Route"),
      ),
      body: Center(
//        child: Text("this is a new route and tip=$tip"),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: str
                  .split("")
                  .map((c) => Text(
                c,
                textScaleFactor: 2.0,
              ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  NewRoute(this.tip);

  final String tip;
}
