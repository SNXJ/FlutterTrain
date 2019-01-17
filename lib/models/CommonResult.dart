class CommonResult {
  int ret;
  int benchmark;
  dynamic response;

  static CommonResult fromMap(Map<String, dynamic> map) {
    CommonResult temp = new CommonResult();
    temp.ret = map['ret'];
    temp.benchmark = map['benchmark'];
    temp.response = map['response'];
    return temp;
  }

  static List<CommonResult> fromMapList(dynamic mapList) {
    List<CommonResult> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
