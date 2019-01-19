import 'package:flutter/material.dart';
import 'package:flutter_first/view/LoadingDialog.dart';
import 'package:flutter_first/view/MessageDialog.dart';
import 'package:flutter_first/view/ToastDialog.dart';

class DialogUtil {
  static showLoading(BuildContext context) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new LoadingDialog(
            //调用对话框
            text: '加载中...',
          );
        });
  }

  static cancelDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static showMsgDialog(BuildContext context, msg) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new MessageDialog(
            message: msg,
            negativeText: "知道了",
            onCloseEvent: (() {
              cancelDialog(context);
            }),
          );
        });
  }

  static _showToast(BuildContext context, msg) {
    showDialog<Null>(
        context: context, //BuildContext对象
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new ToastDialog(
            message: msg,
          );
        });
  }

  static showToastDialog(context, msg) {
    _showToast(context, msg);
    Future.delayed(new Duration(seconds: 1 ), () {}).then((data) {
      cancelDialog(context);
    });
  }
}
