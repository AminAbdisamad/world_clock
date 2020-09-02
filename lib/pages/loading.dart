import 'package:flutter/material.dart';
import 'package:clock_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'dart:convert';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  //Get Country Flag
  void getFlag() async{
    Response response = await get("https://restcountries.eu/rest/v2/capital/London");
    // print(response.body);
    List data = jsonDecode(response.body);
    // print(data);
    String countryFlag = data.map((country)=>country).toString();
    print(countryFlag);

  }

  void setupWorldTime  ()async{
    WorldTime  obj1 = WorldTime(location: "Mogadishu",flag: "Somalia",url: "Africa/Mogadishu");
    await obj1.getTime();

    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "location":obj1.location,
      "flag":obj1.flag,
      "time":obj1.time,
      "isDaytime":obj1.isDaytime,
    });


  }

  @override
  void initState() {
    super.initState();
    //call for WorldTime
    setupWorldTime ();

  //  call getFlag
    getFlag();

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body:Center(
        child:SpinKitThreeBounce(
          color: Colors.white,
          size: 80.0,
        )
      ),
    );
  }
}
