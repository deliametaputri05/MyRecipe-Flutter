import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({this.list, this.index});

  @override
  _EditDataState createState() => new _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllerGambar = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerDeskripsi = new TextEditingController();
  TextEditingController controllerAlat = new TextEditingController();
  TextEditingController controllerBahan = new TextEditingController();
  TextEditingController controllerProsedur = new TextEditingController();
  TextEditingController controllerKalori = new TextEditingController();
  TextEditingController controllerKarbo = new TextEditingController();
  TextEditingController controllerProtein = new TextEditingController();

  void editData() {
    var url = "http://192.168.100.154/my_recipe/food_edit.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
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
  void initState() {
    controllerGambar =
        new TextEditingController(text: widget.list[widget.index]['gambar']);
    controllerNama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllerDeskripsi =
        new TextEditingController(text: widget.list[widget.index]['deskripsi']);
    controllerAlat =
        new TextEditingController(text: widget.list[widget.index]['alat']);
    controllerBahan =
        new TextEditingController(text: widget.list[widget.index]['bahan']);
    controllerProsedur =
        new TextEditingController(text: widget.list[widget.index]['prosedur']);
    controllerKalori =
        new TextEditingController(text: widget.list[widget.index]['kalori']);
    controllerKarbo =
        new TextEditingController(text: widget.list[widget.index]['karbo']);
    controllerProtein =
        new TextEditingController(text: widget.list[widget.index]['protein']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("EDIT DATA"),
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
                  child: new Text("EDIT DATA"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new Home()));
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
