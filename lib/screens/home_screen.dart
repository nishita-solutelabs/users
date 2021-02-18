import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users/screens/bookmarked_screen.dart';
import 'package:users/screens/user_screen.dart';
import 'package:users/user/userdata.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  'Users',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  'Bookmarked Users',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => UserData(),
          child: TabBarView(
            children: [
              UserScreen(),
              BookMarkedScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
