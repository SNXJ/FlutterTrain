import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_first/pages/CommonWebPage.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//公共的WebView页面，需要标题和URL参数
class DiscoverLearnPage extends StatefulWidget {
  String title;

  @override
  State<StatefulWidget> createState() {
    return new DiscoverLearnPageState();
  }
}

class DiscoverLearnPageState extends State<DiscoverLearnPage> {
  String url = "https://hjapi.51tzvip.com/webView/learning_yard";
  final flutterWebViewPlugin = new FlutterWebviewPlugin();

  @override
  Widget build(BuildContext context) {
    _getLink(url, title) {
//    return () {
      Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) {
        return new CommonWebPage(title: title, url: url);
      }));
//    };
    }

    return new Center(
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.blue,
        onPressed: () => _getLink(url, "学习专区"),
        child: Text(
          "学习专区",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
//bug
//    return   WebviewScaffold(
//
//        url: url,
//        withZoom: true,
//        withLocalStorage: true,
//        withJavascript: true,
//    );
  }
}
