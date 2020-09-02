import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    //Set Background Image for a day or a night
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';

    // Change
    return Scaffold(

      appBar: AppBar(
        title:Text("World Clock"),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
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
                    onPressed: () {Navigator.pushNamed(context, "/location");},
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
