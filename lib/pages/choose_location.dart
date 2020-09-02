import "package:flutter/material.dart";


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   int counter = 0;
   
  // Simulate Network Request 
   void getData () async{

     //Simulate Network Request that gets username
     String username = await Future.delayed(Duration(seconds:3),(){
       return ("Aminux");
     });

   //  Simulate Network Request that gets job title of the username
     String position = await Future.delayed(Duration(seconds: 2),(){
       return("Software Engineer");
     });

     print("$username - $position");

   }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Run InitState function");

  //  getUserName
    getData();
  }


  @override
  Widget build(BuildContext context) {
    print("Run Build Function");
    return Scaffold(

      appBar: AppBar(
        title: Text("Choose Location"),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        elevation: 0.0,
      ),
     body: RaisedButton(
       onPressed: ()=>setState(()=>counter+=1),
       child: Text("You Pressed $counter Times"),
     )
    );
  }
}

