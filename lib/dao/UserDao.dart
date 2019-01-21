import 'package:flutter_first/models/ErrorMsg.dart';
import 'package:flutter_first/models/ResultModel.dart';
import 'package:flutter_first/models/UserInfo.dart';
import 'package:flutter_first/net/Api.dart';
import 'package:flutter_first/net/Constant.dart';
import 'package:flutter_first/net/NetManager.dart';

class UserDao {
  static login(context, url, paramMap) async {
    var res = await NetManager.doPost(context, url, paramMap);
    return res == null ? res : UserInfo.fromMap(res);
  }
  static logOut(context, url, paramMap) async {
    var res = await NetManager.doPost(context, url, paramMap);
    return res == null ? res : ErrorMsg.fromMap(res);
  }

  static getAccessToken(context) async {
    var res = await NetManager.doPost(
        context, Api.ACCESS_TOKEN, Constant.getTokenMap());
    return res == null ? res : ResultModel.fromMap(res);
  }
}
