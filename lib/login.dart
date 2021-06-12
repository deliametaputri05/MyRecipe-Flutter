import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double getSmallDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

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
        // Alert(
        //   context: context,
        //   title: "Berhasil Login !",
        //   type: AlertType.success,
        // ).show();
        Navigator.pushReplacementNamed(context, '/AdminPage');
      } else if (dataUser[0]['level'] == 'user') {
        // Alert(
        //         context: context,
        //         title: "Berhasil Login !",
        //         type: AlertType.success)
        //     .show();
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
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getSmallDiameter(context) / 3,
            top: -getSmallDiameter(context) / 2.5,
            child: Container(
              width: getSmallDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFA500), Color(0xFFE6652E)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            left: -getBigDiameter(context) / 4,
            top: -getBigDiameter(context) / 4,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 40.0),
                child: Center(
                    child: Image.asset(
                  "assets/icons/logo_white.png",
                  width: 150,
                )
                    // child: Text(
                    //   "My Recipe",
                    //   style: TextStyle(
                    //       fontFamily: "Pacifico",
                    //       fontSize: 30,
                    //       color: Colors.white),
                    // ),
                    ),
              ),
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Color(0xFFE6652E), Color(0xFFFFA500)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
            ),
          ),
          Positioned(
            right: -getBigDiameter(context) / 2,
            bottom: -getBigDiameter(context) / 2,
            child: Container(
              width: getBigDiameter(context),
              height: getBigDiameter(context),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xFFFCEED6)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  margin: EdgeInsets.fromLTRB(20, 300, 20, 10),
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 25),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: user,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person, color: Color(0xFFFFA500)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFFFA500))),
                            labelText: "Username : ",
                            labelStyle: TextStyle(color: Color(0xFFFFA500))),
                      ),
                      TextField(
                        controller: pass,
                        obscureText: _secureText,
                        decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key, color: Color(0xFFFFA500)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFA500))),
                          labelText: "Password : ",
                          labelStyle: TextStyle(color: Color(0xFFFFA500)),
                          suffixIcon: IconButton(
                            onPressed: showHide,
                            icon: Icon(
                                _secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFFFFA500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                    child: Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(
                          color: Color(0xFFFFA500),
                          fontSize: 11,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(80, 0, 80, 30),
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 40,
                      child: Container(
                          child: Material(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              splashColor: Colors.amber,
                              onTap: () {
                                _login();
                              },
                              child: Center(
                                child: Text("SIGN IN",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFFFA500),
                                    Color(0xFFFFA500)
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "DON'T HAVE AN ACCOUNT ? ",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "SIGN UP ",
                      style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFFFFA500),
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
