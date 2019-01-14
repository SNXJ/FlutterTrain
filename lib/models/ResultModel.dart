class ResultModel {
  int ret;
  int benchmark;
  ResponseBean response;

  static ResultModel fromMap(Map<String, dynamic> map) {
    ResultModel temp = new ResultModel();
    temp.ret = map['ret'];
    temp.benchmark = map['benchmark'];
    temp.response = ResponseBean.fromMap(map['response']);
    return temp;
  }

  static List<ResultModel> fromMapList(dynamic mapList) {
    List<ResultModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class ResponseBean {
  String token;
  int uid;
  int validtime;

  static ResponseBean fromMap(Map<String, dynamic> map) {
    ResponseBean responseBean = new ResponseBean();
    responseBean.token = map['token'];
    responseBean.uid = map['uid'];
    responseBean.validtime = map['validtime'];
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
