import 'package:flutter/material.dart';

class BookMarkedScreen extends StatefulWidget {
  @override
  _BookMarkedScreenState createState() => _BookMarkedScreenState();
}

class _BookMarkedScreenState extends State<BookMarkedScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(''),
              ),
              title: Text(
                '',
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
