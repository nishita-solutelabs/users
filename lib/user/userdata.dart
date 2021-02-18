import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:users/networking.dart';
import 'package:users/user/user.dart';

class UserData extends ChangeNotifier {
  List<User> userList = [];
  List<User> bookmarkList = [];
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

  void addBookMark(User user) {
    bookmarkList.add(user);
    box.add(user);
    notifyListeners();
  }

  void removeBookMark(User user) {
    bookmarkList.remove(user);
    box.delete(user);
    notifyListeners();
  }

  bool isBookMarked(User user) {
    return bookmarkList.contains(user);
  }

  void clearData() {
    bookmarkList.clear();
    notifyListeners();
  }
}
