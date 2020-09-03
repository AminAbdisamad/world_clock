import "package:flutter/material.dart";
import 'package:clock_app/services/world_time.dart';
// import 'package:flutter_svg/flutter_svg.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


   List<WorldTime>   locations =[
     WorldTime(location: "Mogadishu",url: "Africa/Mogadishu"),
     WorldTime(location:"Djibouti",url: "Africa/Djibouti"),
     WorldTime(location: "London",url: "Europe/London"),
     WorldTime(location: "Ankara",url: "Europe/Ankara"),
     WorldTime(location: "Jakarta",url: "Asia/Jakarta"),
     WorldTime(location: "Seoul", url: "Asia/Seoul")
   ];
   


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        elevation: 0.0,
      ),
     body: ListView.builder(
       itemCount: locations.length,
         itemBuilder: (context,index){
         return Card(
           child: ListTile(
             onTap: (){},
             title: Text(locations[index].location),
             leading: CircleAvatar(
               backgroundImage:AssetImage("assets/night.jpg")
               ) ,
             ),
         );
         }
     ),
    );
  }
}

