import 'package:flutter_first/models/User.dart';

class UserInfo {
  String message;
  User data;

  static UserInfo fromMap(Map<String, dynamic> map) {
    UserInfo responseBean = new UserInfo();
    responseBean.message = map['message'];
    responseBean.data = User.fromMap(map['data']);
    return responseBean;
  }

  static List<UserInfo> fromMapList(dynamic mapList) {
    List<UserInfo> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
