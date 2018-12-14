import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SimpleGirdView extends StatefulWidget {
  @override
  _SimpleGirdViewState createState() {
    return _SimpleGirdViewState();
  }
}

class _SimpleGirdViewState extends State<SimpleGirdView> {
  final List<GVItem> items = new List<GVItem>.generate(
    30,
    (i) => new GVItem("item $i"),
  );

  @override
  void initState() {
    super.initState();
  }

  Widget divider1 = Divider(
    color: Colors.blue,
  );
  Widget divider2 = Divider(color: Colors.green);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("简单GirdView"),
      ),
      body: new GridView.builder(
//        crossAxisCount: 2,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //纵轴三个子widget
            childAspectRatio: 1.0 //宽高比为1时，子widget
            ),

        itemCount: items.length,

        itemBuilder: (context, index) {
          final item = items[index];
          if(index%2==0){

            return new Container(
              color: Colors.blue,
              child: Center(
                child: new Text(
                  item.str,
                  style: new TextStyle(
                    color: Colors.white,
                  ),
                ),
//
//            ),
              ),
            );

          }else{


          return new Container(
            color: Colors.red,
            child: Center(
              child: new Text(
                item.str,
                style: new TextStyle(
                  color: Colors.green,
                ),
              ),
//
//            ),
            ),
          );

          }
        },
      ),
    );
  }
}

// A ListItem that contains data to display a heading
class GVItem {
  final String str;

  GVItem(this.str);
}
