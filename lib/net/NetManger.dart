import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_first/dao/UserDao.dart';
import 'package:flutter_first/models/CommonResult.dart';
import 'package:flutter_first/models/ErrorMsg.dart';
import 'package:flutter_first/net/Api.dart';
import 'package:connectivity/connectivity.dart';

class NetManger {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static String token;
  static Options options = new Options(
    baseUrl: Api.BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
    contentType: ContentType.parse("application/x-www-form-urlencoded"),
    responseType: ResponseType.JSON,
  );

  static doPost(url, paramMap) async {
    // 或者通过传递一个 `options`来创建dio实例
    Dio dio = new Dio(options);
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("=====检查网络======");
      return null;
    }
    Response response;
    try {
      response = await dio.post(url, data: paramMap);
    } on DioError catch (e) {
      print('请求异常url=$url: e=' + e.toString());
      return null;
    }
    CommonResult commonResult = CommonResult.fromMap(response.data);
    print("请求url = $url ;paramMap = ${paramMap.toString()}");
    print("响应url = $url ;response = ${response.data}");

    if (0 == commonResult.ret) {
      //正常
      return commonResult.response;
    } else {
      //错误的
      _handError(commonResult.response);
      return null;
    }
  }

  static void _handError(response) {
    ErrorMsg errorMsg = ErrorMsg.fromMap(response);
    if (null != errorMsg &&
        errorMsg.data != null &&
        errorMsg.data.status_code != null) {
      var errorCode = errorMsg.data.status_code;

      if (errorCode == 400 ||
          errorCode == 401 ||
          errorCode == 402 ||
          errorCode == 403 ||
          errorCode == 500) {
        //getAccessToken();
        UserDao.getAccessToken();

        print(
            "==Error_code==${errorMsg.data.status_code}==Error_msg==${errorMsg.message}");
      }
    } else {
      print("==Error_msg==${errorMsg.message}");
    }
  }
}
