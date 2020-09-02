import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text("World Clock"),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        elevation: 0.0,
      ),
      body:Center(
        child: Column(
          children:<Widget> [
            FlatButton.icon(
                onPressed: () {Navigator.pushNamed(context, "/location");},
                icon:Icon(Icons.edit_location),
                label:Text("Edit Location"))
          ],
        ),
      )
    );
  }
}
