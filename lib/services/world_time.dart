import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


//World Time Class

class WorldTime
{
  String location,time,flag,url;
  bool isDaytime;

//  Constructor
  WorldTime({this.location,this.flag,this.url});


//get data from external API
  Future<void> getTime () async{
    try{
      Response response = await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);

      // Get datetime and offset from data object
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);

      //Create Datetime Object and Parse
      DateTime now = DateTime.parse(dateTime);

      // Add offsets to datetime
      now = now.add(Duration(hours: int.parse(offset)));

    //isDaytime is true for daytime and false for nighttime
    isDaytime = now.hour > 6 && now.hour < 19 ? true : false;


    //  Change DateTime to readable format
      time = DateFormat.jm().format(now);
    }
    catch(e)
    {
      print("Something Went wrong: $e");
      time = "Couldn't get time";
    }



  }

}


// Memic object creation

// WorldTime obj1 = WorldTime(location: "Mogadishu",flag: "Somalia",url: "Africa/Mogadishu");







