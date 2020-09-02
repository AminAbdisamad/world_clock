import 'package:flutter/material.dart';
import 'package:clock_app/pages/home.dart';
import 'package:clock_app/pages/choose_location.dart';
import 'package:clock_app/pages/loading.dart';


void main() {

  runApp(MaterialApp(
    // home:Home(),
    initialRoute: "/home",
    routes: {
      "/":(context)=>Home(),
      "/home" : (context) => Home(),
      "/location" : (context) => ChooseLocation(),
      "/loading" : (context) => Loading(),
    }

  ));
}
