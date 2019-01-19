import 'package:flutter_first/models/ResultModel.dart';
import 'package:flutter_first/models/UserInfo.dart';
import 'package:flutter_first/net/Api.dart';
import 'package:flutter_first/net/NetManager.dart';

class UserDao {
  static login<T>(context,url, paramMap) async {
    var res = await NetManager.doPost(context,url, paramMap);
    return  res == null ? res : UserInfo.fromMap(res);
  }

  static Map tokenMap = {
    "client_id": "7",
    "code": "1547460226966",
    "grant_type": "authorization_code",
    "uuid": "1545708413075-9099610000-7074710000",
    "sign": "c6befd93b2eaf7c4993d3ef823be8437"
  };

  static getAccessToken(context) async {
    var res = await NetManager.doPost(context,Api.ACCESS_TOKEN, tokenMap);
    //异常处理
    if (res != null) {
      ResultModel result = ResultModel.fromMap(res);
      print("===getAccessToken===${result.token.toString()}");
    } else {
      print("===getAccessToken===null");
    }
  }
}
