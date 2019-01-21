import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImageRoute extends StatefulWidget {
  @override
  _ImageRouteState createState() {
    return _ImageRouteState();
  }
}

class _ImageRouteState extends State<ImageRoute> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("图片"),
      ),
      body: new SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: new Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.accessible,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.error,
                  color: Colors.purple,
                ),
                Icon(
                  Icons.fingerprint,
                  color: Colors.green,
                ),
                Icon(
                  Icons.access_alarm,
                  color: Colors.red,
                ),
              ],
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("images/demo.png"),
                  width: 100,
                ),
                Image.asset(
                  "images/head_done.png",
                  width: 60.0,
//                color: Colors.yellow,
//                colorBlendMode: BlendMode.difference,
                ),

              ],
            ),
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
        new Image.network(
        "https://avatars1.githubusercontent.com/u/12548835?s=460&v=4",
          height: 100,
          width: 100,
        ),
        new FadeInImage.memoryNetwork(
          //占位淡出
            height: 100,
            placeholder: kTransparentImage,
            image:
            "https://avatars1.githubusercontent.com/u/12548835?s=460&v=4"),

//        new CachedNetworkImage(//缓存
//          placeholder: new CircularProgressIndicator(),
//          imageUrl: 'https://github.com/flutter/website/blob/master/_includes/code/layout/lakes/images/lake.jpg?raw=true',
//        );
        ],
      ),

      //支持GIF
      ],
    ),)
    ,
    );
  }
}
