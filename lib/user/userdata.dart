import 'package:flutter/cupertino.dart';
import 'package:users/networking.dart';
import 'package:users/user/user.dart';

class UserData extends ChangeNotifier {
  List<User> userList = [];
  List userJsonData;

  void getdata() async {
    ApiData data = ApiData();

    userJsonData = await data.getApiJsonData();
    Future.delayed(Duration(seconds: 1));
    for (var x in userJsonData) {
      userList.add(User(x['login'], x['avatar_url']));
    }
    notifyListeners();
  }
}
