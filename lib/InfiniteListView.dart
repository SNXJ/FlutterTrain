import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfiniteListView extends StatefulWidget {
  @override
  _InfiniteListViewState createState() => new _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  bool showToTopBtn = false;
  ScrollController _lvScrollController = new ScrollController();

  @override
  void initState() {
    _retrieveData();
    _showOrhintBtn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("上拉加载/回到顶部"),
      ),
      body: ListView.separated(
        controller: _lvScrollController,
        itemCount: _words.length,
        itemBuilder: (context, index) {
//        如果到了表尾
          if (_words[index] == loadingTag) {
            //不足100条，继续获取数据
            if (_words.length - 1 < 100) {
              //获取数据
              _retrieveData();
              //加载时显示loading
              return Container(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0)),
              );
            } else {
              //已经加载了100条数据，不再获取数据。
              return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "没有更多了",
                    style: TextStyle(color: Colors.grey),
                  ));
            }
          }
          //显示单词列表项
//        return ListTile(title: Text("$index "+_words[index]));

          return new GestureDetector(
            child: new ListTile(title: Text("${index + 1} " + _words[index])),
            onTap: () {
              //点击条目

              print("click position=${index + 1}");
            },
          );
        },
        separatorBuilder: (context, index) => Divider(height: .0),
      ),
      floatingActionButton: !showToTopBtn == true
          ? null
          : new FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
              _lvScrollController.animateTo(0,
                  duration: Duration(milliseconds: 200), curve: Curves.ease);
            }),
    );
  }

  void _showOrhintBtn() {
    _lvScrollController.addListener(() {
      if (_lvScrollController.offset > 100 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      } else if ((_lvScrollController.offset <= 100 && showToTopBtn)) {
        setState(() {
          showToTopBtn = false;
        });
      }

    });
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}
