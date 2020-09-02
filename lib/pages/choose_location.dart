import "package:flutter/material.dart";


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   int counter = 0;
   


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Run InitState function");

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

