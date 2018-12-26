import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  // This widget is the root of your application.
  LoginRoute(this.tip);

  final String tip;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new LoginRoutePage(),
    );
  }
}

class LoginRoutePage extends StatefulWidget {
  @override
  _LoginRouteState createState() {
    return new _LoginRouteState();
  }
}

class _LoginRouteState extends State<LoginRoutePage> {
//  String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  TextEditingController _loginController = new TextEditingController();
String errorEmailText;
String _emailStr;
  @override
  Widget build(BuildContext context) {
//    _loginController.text = "此处测试默认显示高亮";
//    _loginController.selection = TextSelection(
//        baseOffset: 4, extentOffset: _loginController.text.length
//    );

    _loginController.addListener(() {
      //监听输入
      print("controller:" + _loginController.text);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("LoginRoute"),
      ),
      body: Center(
//        child: Text("this is a new route and tip=$tip"),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 35, right: 35),
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.search,//修改键盘
                  controller: _loginController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "手机号邮箱",
                      errorText: _getErrorText(),
                      prefixIcon: Icon((Icons.person))


                  ),
                  onChanged: (str) {
                    _emailStr=str;
                    print("用户名：$str");
//                    setState(() {
//                      if(!isEmail(str)){
//                        errorEmailText="请输入正确的邮箱";
//                      }else{
//                        errorEmailText=null;
//                      }
//
//
//                    });


                  },
                //  不起作用
                  onSubmitted: (String str) {
                    setState(() {
                      if(!isEmail(str)){
                        errorEmailText="请输入正确的邮箱";
                      }else{
                        errorEmailText=null;
                      }


                    });
                  },
                ),
                TextField(
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "登录密码",
                      prefixIcon: Icon(Icons.lock)),
                  obscureText: true,
                ),
                RaisedButton(
                  materialTapTargetSize: MaterialTapTargetSize.padded,

                  child: Text("登陆"),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: (){
                    setState(() {
                      if(!isEmail(_emailStr)){
                        errorEmailText="请输入正确的邮箱";
                      }else{
                        errorEmailText=null;
                      }
                    });

                  },

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                )
              

                

              ],
            ),
          ),
        ),
      ),
    );

  }
  _getErrorText(){
    return errorEmailText;
  }
  bool isEmail(String em){
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);

  }


}
