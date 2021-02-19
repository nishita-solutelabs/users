import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:users/user/userdata.dart';
import 'package:users/user/userhive.dart';

class BookMarkedScreen extends StatefulWidget {
  @override
  _BookMarkedScreenState createState() => _BookMarkedScreenState();
}

class _BookMarkedScreenState extends State<BookMarkedScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box('userBox').listenable(),
          builder: (BuildContext context, Box<dynamic> box, Widget child) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final user = box.getAt(index) as UserHive;
                return box.length == 0
                    ? Center(
                        child: Text('No bookmarks'),
                      )
                    : Card(
                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(user.url),
                          ),
                          title: Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                          trailing: Icon(
                            Icons.star_border,
                            size: 30.0,
                            color: Colors.yellow,
                          ),
                          onTap: () {
                            box.deleteAt(index);
                          },
                        ),
                      ));
              },
              itemCount: box.length == 0 ? null : box.length,
            );
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
