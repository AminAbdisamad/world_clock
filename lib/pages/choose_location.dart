import "package:flutter/material.dart";
import 'package:clock_app/services/world_time.dart';



class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


   List<WorldTime>   locations =[
     WorldTime(location: "Mogadishu",url: "Africa/Mogadishu"),
     WorldTime(location:"Djibouti",url: "Africa/Djibouti"),
     WorldTime(location: "London",url: "Europe/London"),
     WorldTime(location: "Ankara",url: "Europe/Istanbul"),
     WorldTime(location: "Jakarta",url: "Asia/Jakarta"),
     WorldTime(location: "Seoul", url: "Asia/Seoul")
   ];

   void updateTime(index) async{
     WorldTime obj1 = locations[index];
     await obj1.getTime();
     await obj1.getFlag();

     Navigator.pop(context,{
       "location":obj1.location,
       "flag":obj1.flag,
       "time":obj1.time,
       "isDaytime":obj1.isDaytime,
     });

   }
   


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
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 1.0),
           child: Card(
             child: ListTile(
               onTap: (){updateTime(index);},
               title: Text(locations[index].location),
               leading: CircleAvatar(
                 backgroundImage:AssetImage("assets/day.jpg"),
                 ) ,
               ),
           ),
         );
         }
     ),
    );
  }
}

