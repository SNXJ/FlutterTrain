import 'package:flutter_first/Utils/SpUtil.dart';

class Constant {
  static const ACCESS_TOKEN = "access_token";
  static const USER_INFO = "user_info";
  static const USER_NAME = "user_name";
  static const USER_PHONE = "user_phone";
  static const USER_ID = "user_id";
  static const App_ID = "app_id";

  static getOuterMap() async {
    return {
      "client_id": "7",
      "token": await SpUtil.get(ACCESS_TOKEN),
      "user_id": "0",
      "uuid": "1545708413075-9099610000-7074710000",
      "version": "1.0.1",
      "app_id": "6",
    };
  }

  static getTokenMap() {
    return {
      "client_id": "7",
      "code": "1547460226966",
      "grant_type": "authorization_code",
      "uuid": "1545708413075-9099610000-7074710000",
      "sign": "c6befd93b2eaf7c4993d3ef823be8437"
    };
  }

  static getLogOutMap() async{
    return {
      "client_id": "7",
      "token": "8fc7c8837c730a19c35fe7c86fca3181",
      "user_id":await SpUtil.get(USER_ID),
      "uuid": "1545708413075-9099610000-7074710000",
      "version": "1.0.1",
      "app_id": "6",
      "data": {}
    };
  }
}
