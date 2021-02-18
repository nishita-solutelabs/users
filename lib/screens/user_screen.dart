import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/user/userdata.dart';

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
    return Padding(
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
              ),
              onTap: () {},
            ),
          ));
        },
      ),
    );
  }
}
