import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => new _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerJenkel = new TextEditingController();
  TextEditingController controllerUsername = new TextEditingController();
  TextEditingController controllerPassword = new TextEditingController();
  TextEditingController controllerLevel = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerNohp = new TextEditingController();

  // List<String> level = ["admin", "user"];
  // String _level = "level";

  String _jk = "";

  void _pilihJk(String controllerJenkel) {
    setState(() {
      _jk = controllerJenkel;
    });
  }

  // void _pilihLevel(String controllerLevel) {
  //   setState(() {
  //     _level = controllerLevel;
  //   });
  // }

  void addData() {
    var url = "http://192.168.43.86/my_recipe/user_create.php";

    http.post(url, body: {
      "nama": controllerNama.text,
      "jenkel": controllerJenkel.text,
      "username": controllerUsername.text,
      "password": controllerPassword.text,
      "level": controllerLevel.text,
      "email": controllerEmail.text,
      "no_hp": controllerNohp.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("REGISTER"),
      ),
      body: Container(
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new TextField(
                controller: controllerNama,
                decoration: new InputDecoration(
                    hintText: "Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            RadioListTile(
              value: "Laki-laki",
              title: new Text("Laki-laki"),
              groupValue: _jk,
              onChanged: (String value) {
                _pilihJk(value);
              },
              activeColor: Colors.red,
              subtitle: Text("Pilih ini jika anda Laki-laki"),
            ),
            RadioListTile(
              value: "Perempuan",
              title: new Text("Perempuan"),
              groupValue: _jk,
              onChanged: (String value) {
                _pilihJk(value);
              },
              activeColor: Colors.red,
              subtitle: Text("Pilih ini jika anda Perempuan"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new TextField(
                controller: controllerUsername,
                decoration: new InputDecoration(
                    hintText: "Username",
                    labelText: "Username",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new TextField(
                obscureText: true,
                controller: controllerPassword,
                decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(top: 20.0),
            ),
            new Row(
              children: <Widget>[
                new Text(
                  "Level",
                  style: TextStyle(fontSize: 20.0, color: Colors.orange),
                ),
                // new DropdownButton(
                //   value: _level,
                //   items: level.map((String value) {
                //     return new DropdownMenuItem(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (String value) {
                //     _pilihLevel(value);
                //   },
                // ),
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                ),
                RadioListTile(
                  value: "admin",
                  title: new Text("admin"),
                  groupValue: _jk,
                  onChanged: (String value) {
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: Text("Pilih ini jika anda admin"),
                ),
                RadioListTile(
                  value: "user",
                  title: new Text("user"),
                  groupValue: _jk,
                  onChanged: (String value) {
                    _pilihJk(value);
                  },
                  activeColor: Colors.red,
                  subtitle: Text("Pilih ini jika anda user"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new TextField(
                controller: controllerEmail,
                decoration: new InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: new TextField(
                controller: controllerNohp,
                decoration: new InputDecoration(
                    hintText: "No Hp",
                    labelText: "No Hp",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              child: new Text("Register"),
              color: Colors.blueAccent,
              onPressed: () {
                setState(() {
                  addData();
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
