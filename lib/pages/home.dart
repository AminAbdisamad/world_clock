import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};



  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;
    //Set Background Image for a day or a night
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    //set title bar color
    Color bgColor = data['isDaytime'] ? Colors.grey[300] : Colors.black87;
    // String bgColor = '#000';

    return Scaffold(

      appBar: AppBar(
        title:Text("World Clock",
        style:TextStyle(
          color:Colors.orange[600]
        )),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0.0,
      ),
      body:Container(
        decoration: BoxDecoration(
          image:DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,

          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0,0.0,0.0),
          child: Center(
            child: Column(
              children:<Widget> [

                FlatButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, "/location");

                      setState(() {
                        data = {
                          "time":result["time"],
                          "flag":result['flag'],
                          "location":result['location'],
                          "isDaytime":result['isDaytime']
                        };
                      });

                      },
                    icon:Icon(
                        Icons.edit_location,
                        color:Colors.yellow[900]
                    ),
                    label:Text("Edit Location",
                    style: TextStyle(
                      fontSize: 25.0,  color:Colors.yellow[900]
                    ),)),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WebsafeSvg.network(
                      data['flag'],
                      height: 20.0,
                      
                    ),
                    SizedBox(width: 10.0),
                    Text(data['location'],
                    style: TextStyle(
                      fontSize: 30.0,color:Colors.yellow[900]
                    ),
                    ),

                  ],
                ),
                SizedBox(height: 15.0),
                Text(data["time"],
                style: TextStyle(
                  fontSize: 50.0, color:Colors.yellow[900]

                ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
