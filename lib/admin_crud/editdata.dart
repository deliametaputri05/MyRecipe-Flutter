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
    var url = "http://192.168.43.86/my_recipe/food_edit.php";
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
        title: new Text("Add Recipe"),
        backgroundColor: Color(0xFFFFA500),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          'http://192.168.43.86/my_recipe/uploads/${widget.list[widget.index]['gambar']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    controller: controllerNama,
                    decoration: new InputDecoration(
                      hintText: "Nama Resep",
                      labelText: "Nama Resep",
                      icon:
                          Icon(Icons.event_note_outlined, color: Colors.orange),
                      border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    maxLines: 5,
                    controller: controllerDeskripsi,
                    decoration: new InputDecoration(
                      hintText: "Deskripsi",
                      labelText: "Deskripsi",
                      icon: Icon(
                        Icons.comment_outlined,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    maxLines: 3,
                    controller: controllerAlat,
                    decoration: new InputDecoration(
                      hintText: "Alat",
                      labelText: "Alat",
                      icon: Icon(
                        Icons.restaurant,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    maxLines: 5,
                    controller: controllerBahan,
                    decoration: new InputDecoration(
                      hintText: "Bahan",
                      labelText: "Bahan",
                      icon: Icon(Icons.fastfood_outlined, color: Colors.orange),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    maxLines: 10,
                    controller: controllerProsedur,
                    decoration: new InputDecoration(
                      hintText: "Prosedur",
                      labelText: "Prosedur",
                      icon: Icon(
                        Icons.list_alt_rounded,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    controller: controllerKalori,
                    decoration: new InputDecoration(
                      hintText: "Kalori",
                      labelText: "Kalori",
                      icon: Icon(
                        Icons.local_fire_department_sharp,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    controller: controllerKarbo,
                    decoration: new InputDecoration(
                      hintText: "Karbohidrat",
                      labelText: "Karbohidrat",
                      icon: Icon(
                        Icons.rice_bowl,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: new TextField(
                    cursorColor: Colors.orange,
                    controller: controllerProtein,
                    decoration: new InputDecoration(
                      hintText: "Protein",
                      labelText: "Protein",
                      icon: Icon(
                        Icons.insights,
                        color: Colors.orange,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0)),
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                new RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Text("EDIT DATA",
                      style: TextStyle(color: Colors.white)),
                  color: Color(0xFFFFA500),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {}
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
