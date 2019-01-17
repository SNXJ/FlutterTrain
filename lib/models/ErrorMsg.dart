class ErrorMsg {
  String message;
  DataBean data;

  static ErrorMsg fromMap(Map<String, dynamic> map) {
    ErrorMsg responseBean = new ErrorMsg();
    responseBean.message = map['message'];
    responseBean.data = DataBean.fromMap(map['data']);
    return responseBean;
  }

  static List<ErrorMsg> fromMapList(dynamic mapList) {
    List<ErrorMsg> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class DataBean {
  String status_code;

  static DataBean fromMap(Map<String, dynamic> map) {
    DataBean dataBean = new DataBean();
    dataBean.status_code = map['status_code'];
    return dataBean;
  }

  static List<DataBean> fromMapList(dynamic mapList) {
    List<DataBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
