import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  bool visible = false;
  bool _secureText = true;
  String username = '';

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  String msg = '';
  Future<List> _login() async {
    setState(() {
      visible = true;
    });

    final response = await http.post(
        "http://192.168.100.154/my_recipe/login.php",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login"),
      //   backgroundColor: Colors.orange,
      // ),
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
                  decoration: InputDecoration(
                    hintText: 'Username',
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.person),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100)),
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                TextField(
                  controller: pass,
                  obscureText: _secureText,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.lock),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100)),
                    suffixIcon: IconButton(
                      onPressed: showHide,
                      icon: Icon(_secureText
                          ? Icons.visibility_off
                          : Icons.visibility),
                    ),
                  ),
                ),
                ButtonTheme(
                  minWidth: double.infinity,
                  child: RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: StadiumBorder(),
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
