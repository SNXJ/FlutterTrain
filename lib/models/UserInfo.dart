import 'package:flutter_first/models/User.dart';

class UserInfo {
  int ret;
  int benchmark;
  ResponseBean response;

  static UserInfo fromMap(Map<String, dynamic> map) {
    UserInfo temp = new UserInfo();
    temp.ret = map['ret'];
    temp.benchmark = map['benchmark'];
    temp.response = ResponseBean.fromMap(map['response']);
    return temp;
  }

  static List<UserInfo> fromMapList(dynamic mapList) {
    List<UserInfo> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}



class ResponseBean {
  String message;
  User data;

  static ResponseBean fromMap(Map<String, dynamic> map) {
    ResponseBean responseBean = new ResponseBean();
    responseBean.message = map['message'];
    responseBean.data = User.fromMap(map['data']);
    return responseBean;
  }

  static List<ResponseBean> fromMapList(dynamic mapList) {
    List<ResponseBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

