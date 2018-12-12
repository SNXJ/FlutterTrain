import 'package:flutter/material.dart';

class AnimationRoute extends StatefulWidget {
//  AnimationRoute({Key key, this.title}) : super(key: key);
  final String title = "渐变动画(双击)";

  @override
  _AnimationRouteState createState() => new _AnimationRouteState();
}

class _AnimationRouteState extends State<AnimationRoute>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controller2;
  CurvedAnimation curve;
  CurvedAnimation curve2;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    controller2 = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
    curve2 = new CurvedAnimation(parent: controller2, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FadeTransition(//渐变
                  opacity: curve,
//                turns: curve,
                  child: new FlutterLogo(
                    size: 100.0,
                  )),
              new RotationTransition(//旋转
//                opacity: curve,
                  turns: curve2,
                  child: new FlutterLogo(
                    size: 100.0,
                  ))
            ],
          ),

//        child: new Container(
//            child: new RotationTransition(
////                opacity: curve,
//                turns: curve,
//                child: new FlutterLogo(
//                  size: 100.0,
//                ))

          onDoubleTap: () {
            if (controller2.isCompleted) {
              controller2.reverse();
            } else {
              controller2.forward();
            }
          },
        ),
//
//
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Fade',
        child: new Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}
