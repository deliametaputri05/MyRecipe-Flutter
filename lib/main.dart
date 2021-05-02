import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_recipe/userPage.dart';
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'adminPage.dart';

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
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/AdminPage': (BuildContext context) => new AdminPage(
              username: username,
            ),
        '/UserPage': (BuildContext context) => new UserPage(
              username: username,
            ),
        '/Login': (BuildContext context) => new MyHomePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  bool visible = false;

  String msg = '';
  Future<List> _login() async {
    setState(() {
      visible = true;
    });

    final response = await http.post("http://192.168.43.86/my_recipe/login.php",
        body: {"username": user.text, "password": pass.text});

    var dataUser = json.decode(response.body);

    if (user.text.isEmpty || pass.text.isEmpty) {
      setState(() {
        visible = false;
      });
      Alert(
              context: context,
              title: "Isi Data Dengan Benar !",
              type: AlertType.warning)
          .show();
    } else if (dataUser.length == 0) {
      setState(() {
        visible = false;
      });
      Alert(
              context: context,
              title: "Username/Password Salah !",
              type: AlertType.error)
          .show();
    } else {
      if (dataUser[0]['level'] == 'admin') {
        Alert(
          context: context,
          title: "Berhasil Login !",
          type: AlertType.success,
        ).show();
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (dataUser[0]['level'] == 'user') {
        Alert(
                context: context,
                title: "Berhasil Login !",
                type: AlertType.success)
            .show();
        Navigator.pushReplacementNamed(context, '/UserPage');
      }

      setState(() {
        username = dataUser[0]['username'];
      });
    }

    return dataUser;
  }

  logout() async {
    setState(() {
      Navigator.pushReplacementNamed(context, '/Login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: visible,
                    child: Container(child: CircularProgressIndicator())),
                TextField(
                  controller: user,
                  decoration: InputDecoration(hintText: 'Username'),
                ),
                TextField(
                  controller: pass,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _login();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
