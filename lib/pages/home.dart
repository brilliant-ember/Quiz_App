import 'package:flutter/material.dart';
import 'quizPage.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Material material = new Material(
      color: Colors.purpleAccent,
      child: new InkWell(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
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
