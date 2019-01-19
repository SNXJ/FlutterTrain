import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ToastDialog extends Dialog {
  String title;
  String message;
  String negativeText;
  String positiveText;
  Function onCloseEvent;
  Function onPositivePressEvent;

  ToastDialog({
    Key key,
    @required this.message,
    this.negativeText,
    this.positiveText,
    this.onPositivePressEvent,
    this.onCloseEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(15.0),
      child: new Material(
        type: MaterialType.transparency,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Container(
              decoration: ShapeDecoration(
                color: Color(0x99ffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              margin: const EdgeInsets.all(35.0),
              child: new Column(
                children: <Widget>[
                  new Container(
//                    constraints: BoxConstraints(minHeight: 50.0),
                    child: new Padding(
                      padding: const EdgeInsets.all(20),
                      child: new Center(
                        child: new Text(
                          message,
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
