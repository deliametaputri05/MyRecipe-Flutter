import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'food_user/explore.dart';

class UserPage extends StatelessWidget {
  UserPage({this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: Explore(),
    );
  }
}
