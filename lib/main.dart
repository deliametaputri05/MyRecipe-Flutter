import 'package:flutter/material.dart';
import 'package:my_recipe/userPage.dart';
import 'adminPage.dart';
import 'launcher.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

String username = '';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Admin',
      home: LauncherPage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(
              username: username,
            ),
        '/UserPage': (BuildContext context) => new UserPage(
              username: username,
            ),
        '/Login': (BuildContext context) => new LoginPage(),
      },
    );
  }
}
