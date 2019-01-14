import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_first/models/ResultModel.dart';

class NetManger {
  NetManger netManger;
  Dio dio;
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

  instance() async {
    Response response;
    // 或者通过传递一个 `options`来创建dio实例
    Options options = new Options(
      baseUrl: "https://hjapi.51tzvip.com/",
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: ContentType.parse("application/x-www-form-urlencoded"),
      responseType: ResponseType.JSON,
    );
    dio = new Dio(options);

    Map mapInner = {
      "mobile": "18141906652",
      "password": "111111",
      "push_id": "100d855909689602a27"
    };

    Map mapOuter = {
      "client_id": "7",
      "token": "aa772d09c73b95804db496f76d081cd7",
      "user_id": "0",
      "uuid": "1545708413075-9099610000-7074710000",
      "version": "1.0.1",
      "app_id": "6",
      "data": mapInner
    };


    response = await dio.post("oauth/access_token", data: mapOuter);
//    ResultModel result = new ResultModel.fromMap(response.data);

//    var map = new JsonDecoder().convert(response.data);
    ResultModel result = ResultModel.fromMap(response.data);


    print("====j==data=====" + response.data.toString());
    print("=====ret======" + result.ret.toString());
    print("======token=====" + result.response.token.toString());
    print("=====uid======" + result.response.uid.toString());
    print("======validtime=====" + result.response.validtime.toString());
  }
}
