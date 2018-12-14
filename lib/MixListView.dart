import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MixListView extends StatefulWidget {
  @override
  _MixListViewState createState() {
    return _MixListViewState();
  }
}

class _MixListViewState extends State<MixListView> {
  final List<ListItem> items = new List<ListItem>.generate(
    30,
    (i) => i % 6 == 0
        ? new HeadingItem("大标题 $i")
        : new MessageItem("内容title $i", "内容 body $i"),
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
        title: Text("混合列表"),
      ),
      body: new ListView.builder(
        // Let the ListView know how many items it needs to build
//
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return new ListTile(
              title: new Text(
                item.heading,
                style: Theme.of(context).textTheme.headline,
              ),
            );
          } else if (item is MessageItem) {
            return new ListTile(
              title: new Text(item.sender),
              subtitle: new Text(item.body),
            );
          }
        },

//分割线 ListView.separated
//        separatorBuilder: (context, index) {
//          final item = items[index];
//          if (item is HeadingItem) {
//            return divider1;
//          } else if (item is MessageItem) {
//            return divider2;
//          }
//        },


      ),
    );
  }
}

abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
