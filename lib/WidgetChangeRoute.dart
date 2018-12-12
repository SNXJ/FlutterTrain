import 'package:flutter/material.dart';


class WidgetChangeRoute extends StatefulWidget {
  WidgetChangeRoute({Key key}) : super(key: key);
  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<WidgetChangeRoute> {
  // Default value for toggle
  bool toggle = true;
  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text('Toggle One-$toggle');
    } else {
//      return new MaterialButton(onPressed: () {}, child: new Text('Toggle Button Two'));
      return new   Text('Toggle Two-$toggle');
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("WidgetChangeRoute"),
      ),
      body: new Center(
        child: _getToggleChild(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: new Icon(Icons.update),
      ),

    );
  }
}