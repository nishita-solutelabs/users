import 'package:flutter/cupertino.dart';
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

  void addBookMark(User user) {
    bookmarkList.add(user);
    notifyListeners();
  }

  void removeBookMark(User user) {
    bookmarkList.remove(user);
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
