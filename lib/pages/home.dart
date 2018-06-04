import 'package:flutter/material.dart';

class homePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Material material = new Material(
      color: Colors.purpleAccent,
      child: new InkWell(
        onTap: ()=>print("Kelkh shoz means something"),
        child: new Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            new Text ("Let's Quiz You", style: new TextStyle(color: Colors.white, fontSize: 50.0,  fontWeight: FontWeight.w100)),
            new Text("Tap to start!")
          ]
        )
      )
    );
    return material;
  }
}
