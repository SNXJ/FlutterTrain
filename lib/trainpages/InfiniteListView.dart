import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_first/trainpages/ListViewDetail.dart';

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
        title: Text("上拉/回顶/侧删"),
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

//          return new GestureDetector(
//            child: new ListTile(title: Text("${index + 1} " + _words[index])),
//            onTap: () {
//              //点击条目
//
//              print("click position=${index + 1}");
//              Scaffold.of(context).showSnackBar(new SnackBar(
//                  duration: Duration(milliseconds: 200),
//                  content: new Text("点击第${index + 1}项")));
//            },
//          );

          return _getDismissible(context, _words, index);
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

Widget _getDismissible(BuildContext mContext, List<String> items, int index) {
  return new Dismissible(
    background: new Container(
      color: Colors.red,
//      child:  Text("删除" ,
//
//          style: TextStyle(
//          color: Colors.blue,
//          fontSize: 16,
//          fontFamily: "Courier",
//          background: new Paint()..color = Colors.yellow,
//          decoration: TextDecoration.underline,
//          decorationStyle: TextDecorationStyle.dashed),
//    ),
    ),
    onDismissed: (direction) {
      items.removeAt(index);
      Scaffold.of(mContext).showSnackBar(
//          new SnackBar(content: new Text("删除了第$index项 ${items[index]}"))
          new SnackBar(
              duration: Duration(milliseconds: 200),
              content: new Text("删除了第${index + 1}项  ${items[index + 1]}")));
    },

//
    key: new Key(items[index]),

    child: new GestureDetector(
      child: new ListTile(title: Text("${index + 1} " + items[index])),
      onTap: () {
        //点击条目
//        Navigator.pushNamed(mContext, "ListViewDetail");
        print("click position=${index + 1}");

//        Scaffold.of(mContext).showSnackBar(new SnackBar(
//            duration: Duration(milliseconds: 200),
//            content: new Text("点击第${index + 1}项")));
        //传值
//        Navigator.push(mContext, new MaterialPageRoute(builder: (mContext) =>  new ListViewDetail("${items[index+1]}"),), );
        //返回传值
        _navigateAndDisplaySelection(mContext);
      },
    ),
  );
}


//返回的值 显示出来
_navigateAndDisplaySelection(BuildContext context) async {
  // Navigator.push returns a Future that will complete after we call
  // Navigator.pop on the Selection Screen!
  final result = await Navigator.push(
    context,
    new MaterialPageRoute(builder: (context) => new ListViewDetail("详情页")),
  );

  // After the Selection Screen returns a result, show it in a Snackbar!
  Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("$result")));
}
