import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;
import 'dart:math' as Math;

import 'home.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  File _image;

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerDeskripsi = new TextEditingController();
  TextEditingController controllerAlat = new TextEditingController();
  TextEditingController controllerBahan = new TextEditingController();
  TextEditingController controllerProsedur = new TextEditingController();
  TextEditingController controllerKalori = new TextEditingController();
  TextEditingController controllerKarbo = new TextEditingController();
  TextEditingController controllerProtein = new TextEditingController();

  Future getImageGallery() async {
    // ignore: deprecated_member_use
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(10000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg = new File("$path/image_$rand.png")
      ..writeAsBytesSync(Img.encodePng(smallerImg));

    setState(() {
      _image = compressImg;
    });
  }

  Future getImageCamera() async {
    // ignore: deprecated_member_use
    var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;

    int rand = new Math.Random().nextInt(10000);

    Img.Image image = Img.decodeImage(imageFile.readAsBytesSync());
    Img.Image smallerImg = Img.copyResize(image, width: 500);

    var compressImg = new File("$path/image_$rand.jpg")
      ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

    setState(() {
      _image = compressImg;
    });
  }

  Future upload(File imageFile) async {
    var stream =
        // ignore: deprecated_member_use
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.43.86/my_recipe/food_create.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("gambar", stream, length,
        filename: basename(imageFile.path));

    request.fields['nama'] = controllerNama.text;
    request.fields['deskripsi'] = controllerDeskripsi.text;
    request.fields['alat'] = controllerAlat.text;
    request.fields['bahan'] = controllerBahan.text;
    request.fields['prosedur'] = controllerProsedur.text;
    request.fields['kalori'] = controllerKalori.text;
    request.fields['karbo'] = controllerKarbo.text;
    request.fields['protein'] = controllerProtein.text;

    request.files.add(multipartFile);

    // ignore: await_only_futures
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
  }

  void addData(File imageFile) async {
    var stream =
        // ignore: deprecated_member_use
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://192.168.43.86/my_recipe/food_create.php");

    var request = new http.MultipartRequest("POST", uri);

    var multipartFile = new http.MultipartFile("gambar", stream, length,
        filename: basename(imageFile.path));

    request.fields['nama'] = controllerNama.text;
    request.fields['deskripsi'] = controllerDeskripsi.text;
    request.fields['alat'] = controllerAlat.text;
    request.fields['bahan'] = controllerBahan.text;
    request.fields['prosedur'] = controllerProsedur.text;
    request.fields['kalori'] = controllerKalori.text;
    request.fields['karbo'] = controllerKarbo.text;
    request.fields['protein'] = controllerProtein.text;

    request.files.add(multipartFile);

    // ignore: await_only_futures
    var response = await request.send();
    if (response.statusCode == 200) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
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
                  color: Colors.grey[200],
                  width: 200,
                  height: 200,
                  child: Center(
                    child: _image == null
                        ? new Text("No Image Selected")
                        : new Image.file(_image),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.white,
                        child: Icon(Icons.image_outlined, color: Colors.orange),
                        onPressed: getImageGallery,
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      color: Colors.white,
                      child:
                          Icon(Icons.camera_alt_outlined, color: Colors.orange),
                      onPressed: getImageCamera,
                    ),
                  ],
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
                  child: new Text("ADD DATA",
                      style: TextStyle(color: Colors.white)),
                  color: Color(0xFFFFA500),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {}
                    addData(_image);
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
