import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './editdata.dart';
import './home.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.index, this.list});
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://192.168.100.154/my_recipe/food_delete.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Are You sure want to delete '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
          child: new Text(
            "OK DELETE!",
            style: new TextStyle(color: Colors.black),
          ),
          color: Colors.red,
          onPressed: () {
            deleteData();
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => new Home()));
          },
        ),
        new RaisedButton(
          child: new Text("CANCEL", style: new TextStyle(color: Colors.black)),
          color: Colors.green,
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(
      context: context,
      child: alertDialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          new AppBar(title: new Text("${widget.list[widget.index]['nama']}")),
      body: new Container(
        height: 500,
        padding: const EdgeInsets.all(20.0),
        child: new Card(
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Text(
                  widget.list[widget.index]['nama'],
                  style: new TextStyle(fontSize: 20.0),
                ),
                new Text(
                  "Gambar : ${widget.list[widget.index]['gambar']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "nama : ${widget.list[widget.index]['nama']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "deskripsi : ${widget.list[widget.index]['deskripsi']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "alat : ${widget.list[widget.index]['alat']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "bahan : ${widget.list[widget.index]['bahan']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "prosedur : ${widget.list[widget.index]['prosedur']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "kalori : ${widget.list[widget.index]['kalori']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "karbo : ${widget.list[widget.index]['karbo']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Text(
                  "protein : ${widget.list[widget.index]['protein']}",
                  style: new TextStyle(fontSize: 18.0),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new RaisedButton(
                      child: new Text("EDIT"),
                      color: Colors.green,
                      onPressed: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new EditData(
                          list: widget.list,
                          index: widget.index,
                        ),
                      )),
                    ),
                    new RaisedButton(
                      child: new Text("DELETE"),
                      color: Colors.red,
                      onPressed: () => confirm(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
