import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerGambar = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerDeskripsi = new TextEditingController();
  TextEditingController controllerAlat = new TextEditingController();
  TextEditingController controllerBahan = new TextEditingController();
  TextEditingController controllerProsedur = new TextEditingController();
  TextEditingController controllerKalori = new TextEditingController();
  TextEditingController controllerKarbo = new TextEditingController();
  TextEditingController controllerProtein = new TextEditingController();

  void addData() {
    var url = "http://192.168.100.154/my_recipe/food_create.php";

    http.post(url, body: {
      "gambar": controllerGambar.text,
      "nama": controllerNama.text,
      "deskripsi": controllerDeskripsi.text,
      "alat": controllerAlat.text,
      "bahan": controllerBahan.text,
      "prosedur": controllerProsedur.text,
      "kalori": controllerKalori.text,
      "karbo": controllerKarbo.text,
      "protein": controllerProtein.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("ADD DATA"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerGambar,
                  decoration: new InputDecoration(
                      hintText: "Gambar", labelText: "Gambar"),
                ),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Resep", labelText: "Nama Resep"),
                ),
                new TextField(
                  controller: controllerDeskripsi,
                  decoration: new InputDecoration(
                      hintText: "Deskripsi", labelText: "Deskripsi"),
                ),
                new TextField(
                  controller: controllerAlat,
                  decoration:
                      new InputDecoration(hintText: "Alat", labelText: "Alat"),
                ),
                new TextField(
                  controller: controllerBahan,
                  decoration: new InputDecoration(
                      hintText: "Bahan", labelText: "Bahan"),
                ),
                new TextField(
                  controller: controllerProsedur,
                  decoration: new InputDecoration(
                      hintText: "Prosedur", labelText: "Prosedur"),
                ),
                new TextField(
                  controller: controllerKalori,
                  decoration: new InputDecoration(
                      hintText: "Kalori", labelText: "Kalori"),
                ),
                new TextField(
                  controller: controllerKarbo,
                  decoration: new InputDecoration(
                      hintText: "Karbo", labelText: "Karbo"),
                ),
                new TextField(
                  controller: controllerProtein,
                  decoration: new InputDecoration(
                      hintText: "Protein", labelText: "Protein"),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  child: new Text("ADD DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    setState(() {
                      addData();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => new Home()));
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
