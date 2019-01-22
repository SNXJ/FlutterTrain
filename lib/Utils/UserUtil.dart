import 'package:flutter_first/Utils/SpUtil.dart';
import 'package:flutter_first/models/User.dart';
import 'package:flutter_first/net/Constant.dart';

class UserUtil {
  static setUser(User user) async {
    await SpUtil.save(Constant.USER_NAME, user.nickname);
    await SpUtil.save(Constant.USER_PHONE, user.mobile);
    await SpUtil.save(Constant.USER_ID, user.user_id);
  }



  static clearUser() async {
    await SpUtil.remove(Constant.USER_NAME);
    await SpUtil.remove(Constant.USER_PHONE);
    await SpUtil.remove(Constant.USER_ID);
  }
}
