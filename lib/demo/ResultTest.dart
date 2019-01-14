import 'package:json_annotation/json_annotation.dart';


  ///手动处理

@JsonSerializable()
class ResultTest extends Object {

  final int ret;
  final TokenResponse response;
  final int benchmark;

  ResultTest(this.ret, this.benchmark, this.response);

  ResultTest.fromJson(Map<String, dynamic> json)
      : ret = json['ret'],
        //response = json['response'],
        response = TokenResponse.fromJson(json['response']),
        benchmark = json['benchmark'];

  Map<String, dynamic> toJson() => {
        'ret': ret,
        'response': response,
        'benchmark': benchmark,
      };
}

class TokenResponse {
  final String token;
  final int uid;
  final  validtime;

  TokenResponse(this.token, this.uid, this.validtime);

  TokenResponse.fromJson(Map<String, dynamic> json)
      : token = json['token'],
        uid = json['uid'],
        validtime = json['validtime'];

  Map<String, dynamic> toJson() => {
    'token': token,
    'uid': uid,
    'validtime': validtime,
  };
}
