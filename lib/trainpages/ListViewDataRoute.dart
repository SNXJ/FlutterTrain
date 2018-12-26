//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
////void main() {
////  runApp(new SampleApp());
////}
//
//class ListViewDataRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      title: 'Sample App',
//      theme: new ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: new SampleAppPage(),
//    );
//  }
//}
//
//class SampleAppPage extends StatefulWidget {
//  SampleAppPage({Key key}) : super(key: key);
//
//  @override
//  _SampleAppPageState createState() => new _SampleAppPageState();
//}
//
//class _SampleAppPageState extends State<SampleAppPage> {
//  List widgets = [];
//
//  @override
//  void initState() {
//    super.initState();
//
//    loadData();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("Sample App"),
//        ),
//        body: new ListView.builder(
//            itemCount: widgets.length,
//            itemBuilder: (BuildContext context, int position) {
//              return getRow(position);
//            }));
//  }
//
//  Widget getRow(int i) {
//    return new Padding(
//        padding: new EdgeInsets.all(10.0),
//        child: new Text("Row ${widgets[i]["title"]}")
//    );
//  }
//
//  loadData() async {
//    String dataURL = "https://jsonplaceholder.typicode.com/posts";
//    http.Response response = await http.get(dataURL);
//    setState(() {
//      widgets = JSON.decode(response.body);
//    });
//  }
//}