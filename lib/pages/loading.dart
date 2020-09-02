import 'package:flutter/material.dart';
import 'package:clock_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async{
    WorldTime  obj1 = WorldTime(location: "Ankara",url: "Europe/Istanbul");
    await obj1.getTime();
    await obj1.getFlag();

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
