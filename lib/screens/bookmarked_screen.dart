import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/user/userdata.dart';

class BookMarkedScreen extends StatefulWidget {
  @override
  _BookMarkedScreenState createState() => _BookMarkedScreenState();
}

class _BookMarkedScreenState extends State<BookMarkedScreen> {
  @override
  Widget build(BuildContext context) {
    UserData provider = Provider.of<UserData>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: provider.bookmarkList.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage:
                    NetworkImage(provider.bookmarkList[index].avatarUrl),
              ),
              title: Text(
                provider.bookmarkList[index].login,
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
              trailing: Icon(
                provider.isBookMarked(provider.bookmarkList[index])
                    ? Icons.star_border
                    : Icons.star_border,
                size: 30.0,
                color: provider.isBookMarked(provider.bookmarkList[index])
                    ? Colors.yellow
                    : null,
              ),
              onTap: () {
                if (provider.isBookMarked(provider.bookmarkList[index])) {
                  provider.removeBookMark(provider.bookmarkList[index]);
                } else {
                  provider.addBookMark(provider.bookmarkList[index]);
                }
              },
            ),
          ));
        },
      ),
    );
  }
}
