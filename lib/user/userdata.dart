import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:users/networking.dart';
import 'package:users/user/user.dart';

class UserData extends ChangeNotifier {
  List<User> userList = [];

  List userJsonData;

  void getdata() async {
    ApiData data = ApiData();

    userJsonData = await data.getApiJsonData();
    for (var x in userJsonData) {
      userList.add(User(x['login'], x['avatar_url']));
    }
    notifyListeners();
  }

  var box = Hive.box('userBox');

  bool marked(int index) {
    notifyListeners();
    return box.containsKey(index);
  }

  void clearData() {
    box.clear();
    notifyListeners();
  }
}
