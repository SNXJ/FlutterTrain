class User {
  String nickname;
  String token;
  int user_id;
  int mobile;
  int token_end_time;
  int count_subject;
  List<AppListBean> app;

  static User fromMap(Map<String, dynamic> map) {
    User dataBean = new User();
    dataBean.nickname = map['nickname'];
    dataBean.token = map['token'];
    dataBean.user_id = map['user_id'];
    dataBean.mobile = map['mobile'];
    dataBean.token_end_time = map['token_end_time'];
    dataBean.count_subject = map['count_subject'];
    dataBean.app = AppListBean.fromMapList(map['app']);
    return dataBean;
  }

  static List<User> fromMapList(dynamic mapList) {
    List<User> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}

class AppListBean {
  int app_id;
  int is_lock;
  int mobile;

  static AppListBean fromMap(Map<String, dynamic> map) {
    AppListBean appListBean = new AppListBean();
    appListBean.app_id = map['app_id'];
    appListBean.is_lock = map['is_lock'];
    appListBean.mobile = map['mobile'];
    return appListBean;
  }

  static List<AppListBean> fromMapList(dynamic mapList) {
    List<AppListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}
