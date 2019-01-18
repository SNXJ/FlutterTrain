class User {
  String nickname;
  String token;
  String user_id;
  String mobile;
  int token_end_time;
  String count_subject;
  List<AppListBean> app;

  static User fromMap(Map<String, dynamic> map) {
    User temp = new User();
    temp.nickname = map['nickname'];
    temp.token = map['token'];
    temp.user_id = map['user_id'];
    temp.mobile = map['mobile'];
    temp.token_end_time = map['token_end_time'];
    temp.count_subject = map['count_subject'];
    temp.app = AppListBean.fromMapList(map['app']);
    return temp;
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
  String app_id;
  String is_lock;
  String mobile;

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
