class ResultModel {
  String token;
  int uid;
  int validtime;

  static ResultModel fromMap(Map<String, dynamic> map) {
    ResultModel responseBean = new ResultModel();
    responseBean.token = map['token'];
    responseBean.uid = map['uid'];
    responseBean.validtime = map['validtime'];
    return responseBean;
  }

  static List<ResultModel> fromMapList(dynamic mapList) {
    List<ResultModel> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
