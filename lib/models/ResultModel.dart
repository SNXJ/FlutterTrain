import 'package:flutter_first/models/TokenResponse.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ResultModel extends Object {

  final int ret;
  final TokenResponse response;
  final int benchmark;

  ResultModel(this.ret, this.benchmark, this.response);

  ResultModel.fromJson(Map<String, dynamic> json)
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
