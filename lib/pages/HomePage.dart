import 'package:flutter/material.dart';
import 'package:flutter_first/Utils/DialogUtil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  String title;

  HomePage(this.title);

  @override
  _HomePageState createState() => new _HomePageState(title);
}

class _HomePageState extends State<HomePage> {
  String title;
  var imgUrl = [
    "http://hjimg.51tzvip.com/upload/koudai/original/154357352467586000.png",
    "http://hjimg.51tzvip.com/upload/koudai/original/154744332185080100.png"
  ];
  var linkUrl = [
    "https://hjapi.51tzvip.com/index/news_info1?id=3051&uuid=1545708413075-9099610000-7074710000&client_id=7&user_id=0",
    "https://hjapi.51tzvip.com/index/news_info1?id=3076&uuid=1545708413075-9099610000-7074710000&client_id=7&user_id=0"
  ];

  var goodsUrl=[
    "http://hjimg.51tzvip.com/upload/koudai/oauth/20180824/153511574632012600.png",
    "http://hjimg.51tzvip.com/upload/koudai/oauth/20180824/15351157696605200.png",
    "http://hjimg.51tzvip.com/upload/koudai/oauth/20180928/153811923517280800.png",
    "http://hjimg.51tzvip.com/upload/koudai/oauth/20180928/153811930216532100.png",
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFF0F1F3),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0) {
            return _getBanner();
          } else if (index == 2) {
            return _getNewScroll();
          } else if (index == 1) {
            return _getProLayout();
          } else {
            return _getGoodItem(index);
          }
        },
        separatorBuilder: (context, index) => new Divider(
              height: 10,
              color: Color(0xFFF0F1F3),
            ),
        itemCount: 6,
      ),
    );
  }

  _HomePageState(this.title);

  _getGoodItem(index) {
    return new Container(
        padding: EdgeInsets.all(10),
        height: 150,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Image(
              height: 140,
              width: 120,
              fit: BoxFit.fill,
              image: new NetworkImage(goodsUrl[index-3]),
            ),
            new Padding(
              padding: EdgeInsets.only(left: 35),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "澳洲红酒",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  new Container(
                    height: 5,
                  ),
                  Text(
                    "产地：澳大利亚",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  new Container(
                    height: 5,
                  ),
                  Text(
                    "60.00/手",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  new Container(
                    height: 5,
                  ),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Colors.red,
                    child: new Text(
                      "立即订购",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      DialogUtil.showMsgDialog(context, "敬请期待...");
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }

  _getBanner() {
    return new Column(
      children: <Widget>[
        new Container(
          height: 138,
          width: MediaQuery.of(context).size.width,
          child: new Swiper(
              itemCount: 2,
              itemBuilder: (context, index) {
                return new Image.network(
                  imgUrl[index],
                  fit: BoxFit.fill,
                );
              },
              autoplay: true,
              pagination: new SwiperPagination(
                margin: EdgeInsets.only(bottom: 5),
                builder: DotSwiperPaginationBuilder(
                  size: 6,
                  activeSize: 6,
                  color: Colors.white,
                  activeColor: Colors.blue,
                ),
              ),
              controller: new SwiperController(),
              autoplayDelay: 3000,
              onTap: (index) {
                print("=====$index====");
              }),
        ),
        _getBannerBottom(),
      ],
    );
  }

  _getBannerBottom() {
    return new Container(
      color: Colors.white,
      height: 65,
      padding: EdgeInsets.only(bottom: 10),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListTile(
              onTap: () {
                DialogUtil.showMsgDialog(context, "敬请期待...");
              },
              leading: new Image(
                  width: 40,
                  height: 40,
                  image: AssetImage("images/home_new_school.png")),
              title: new Text(
                "新手学堂",
                style: new TextStyle(fontSize: 14),
              ),
              subtitle: new Text(
                "什么是新手学堂",
                style: new TextStyle(fontSize: 12),
              ),
            ),
          ),
          new Container(
            width: 1,
            color: Color(0xFFF0F1F3),
          ),
          Expanded(
            flex: 1,
            child: ListTile(
              onTap: () {
                DialogUtil.showMsgDialog(context, "敬请期待...");
              },
              leading: new Image(
                  width: 40,
                  height: 40,
                  image: AssetImage("images/home_profit_list.png")),
              title: new Text(
                "盈利榜",
                style: new TextStyle(fontSize: 14),
              ),
              subtitle: new Text(
                "最高盈利 300%",
                style: new TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _getProLayout() {
    return new Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: new Swiper(
          loop: false,
          index: 0,
          itemCount: 2,
          itemBuilder: (context, index) {
            return _getProItem(index);
          },
          autoplay: false,
          pagination: new SwiperPagination(
            margin: EdgeInsets.only(bottom: 5),
            builder: DotSwiperPaginationBuilder(
              size: 6,
              activeSize: 6,
              color: Color(0xFFF0F1F3),
              activeColor: Colors.blue,
            ),
          ),
          controller: new SwiperController(),
          autoplayDelay: 3000,
          onTap: (index) {
            print("=====$index====");
          }),
    );
  }

  _getProItem(index) {
    return new Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        direction: Axis.horizontal,
        children: index == 0
            ? <Widget>[
                _getProItemChild("英国威士忌", true),
                _getProItemChild("日本清酒", false),
                _getProItemChild("澳洲红酒", true),
              ]
            : <Widget>[
                _getProItemChild("法国波尔多", true),
                _getProItemChild("新疆吐鲁番", true),
                _getProItemChild("", true, 2),
              ],
      ),
    );
  }

  _getProItemChild(str, isRed, [index]) {
    return Expanded(
      flex: 1,
      child: new Column(
        children: <Widget>[
          Text(
            str,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          new Container(
            height: 5,
          ),
          Text(
            index == 2 ? "" : "1307.9",
            style: TextStyle(
                fontSize: 24, color: isRed ? Colors.red : Colors.green),
          ),
          new Container(
            height: 5,
          ),
          Text(
            index == 2 ? "" : "+1.5   +0.11%",
            style: TextStyle(
                fontSize: 12, color: isRed ? Colors.red : Colors.green),
          ),
        ],
      ),
    );
  }

  _getNewScroll() {
    return new Container(
      height: 65,
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: new Swiper(
          itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () => {},
              leading: new Image(
                width: 32,
                height: 32,
                image: AssetImage("images/home_profit_icon.png"),
                fit: BoxFit.fill,
              ),
              title: new Text(
                "最新播报盈利榜排名",
                style: new TextStyle(fontSize: 13),
              ),
              subtitle: new Text(
                "来自中国台湾的蔡小姐 最高盈利 300%",
                style: new TextStyle(fontSize: 12),
              ),
            );
          },
          autoplay: true,
          pagination: null,
          controller: new SwiperController(),
          autoplayDelay: 3000,
          onTap: (index) {
            print("=====$index====");
          }),
    );
  }
}
