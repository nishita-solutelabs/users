import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:users/user/userdata.dart';
import 'package:users/user/userhive.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserData>(context, listen: false).getdata();
  }

  @override
  Widget build(BuildContext context) {
    UserData provider = Provider.of<UserData>(context);
    final box = Hive.box('userBox');

    return RefreshIndicator(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: provider.userList.length,
          itemBuilder: (context, index) {
            return Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      NetworkImage(provider.userList[index].avatarUrl),
                ),
                title: Text(
                  provider.userList[index].login,
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                trailing: Icon(
                  Icons.star_border,
                  size: 30.0,
                  color: provider.marked(index) ? Colors.yellow : null,
                ),
                onTap: () {
                  final name1 = provider.userList[index].login;
                  final url1 = provider.userList[index].avatarUrl;
                  box.add(UserHive(name1, url1));
                  provider.marked(index);
                },
              ),
            ));
          },
        ),
      ),
      onRefresh: pullToRefresh,
    );
  }

  Future pullToRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    Provider.of<UserData>(context, listen: false).clearData();
  }
}
