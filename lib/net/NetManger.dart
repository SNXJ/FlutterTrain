import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_first/models/CommonResult.dart';
import 'package:flutter_first/models/ErrorMsg.dart';
import 'package:flutter_first/models/ResultModel.dart';
import 'package:flutter_first/net/Api.dart';

class NetManger {
//  NetManger netManger;
  static Dio dio;
  static Dio tokenDio;
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static String token;

  static doPost(url, paramMap) async {
    // 或者通过传递一个 `options`来创建dio实例
    Options options = new Options(
      baseUrl: Api.BASE_URL,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: ContentType.parse("application/x-www-form-urlencoded"),
      responseType: ResponseType.JSON,
    );
    dio = new Dio(options);
    tokenDio = new Dio(options);
    Map tokenMap = {
      "client_id": "7",
      "code": "1547460226966",
      "grant_type": "authorization_code",
      "uuid": "1545708413075-9099610000-7074710000",
      "sign": "c6befd93b2eaf7c4993d3ef823be8437"
    };

    Map mapInner = {
      "mobile": "18141906652",
      "password": "111111",
      "push_id": "100d855909689602a27"
    };

    Map mapOuter = {
      "client_id": "7",
      "token": "f7e93ef220d51d9fa54daceee75539c4",
      "user_id": "0",
      "uuid": "1545708413075-9099610000-7074710000",
      "version": "1.0.1",
      "app_id": "6",
      "data": mapInner
    };

    var res = await dio.post(url, data: tokenMap).then((response) {
      CommonResult commonResult = CommonResult.fromMap(response.data);
      print("请求url = $url ;paramMap = ${tokenMap.toString()}");
      print("响应url = $url ;response = ${response.data}");
      if (0 == commonResult.ret) {
        //正常
        return commonResult.response;
      } else {
        //错误的
        _handError(commonResult.response);
        return null;
      }
    });
    return res;

//    if (null == token) {
//      dio.lock();
//      tokenDio.post("oauth/access_token", data: tokenMap).then((response) {
//        // TODO 存储token
//        ResultModel tokenResult = ResultModel.fromMap(response.data);
//        print("=========save_token========" +
//            tokenResult.response.token.toString());
//        token = tokenResult.response.token.toString();
//      }).whenComplete(() {
//        dio.unlock();
//        dio.post("customer/login", data: mapOuter).then((response2) {
//          print("=========Complete========" + response2.data.toString());
//          return response2.data;
//        });
//      });
//    } else {
//      dio.post("customer/login", data: mapOuter).then((response) {
//        print("=========else========" + response.data.toString());
//        return response.data;
//      });
//    }
//   return   await doOther();
  }

  static void _handError(response) {
    ErrorMsg errorMsg = ErrorMsg.fromMap(response);

    print("==Error_msg=======" +
        "Error_code=" +
        errorMsg.data.status_code +
        "===" +
        errorMsg.message);
  }
}
