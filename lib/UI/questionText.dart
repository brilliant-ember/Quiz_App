import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{
  final String question;
  QuestionText(this.question);
  @override
    State<StatefulWidget> createState() {
      return new TheState(question);
    }
}

class TheState extends State<QuestionText> with SingleTickerProviderStateMixin{
  Animation<double> _fontSizeAnime;
  AnimationController _fontSizeAnimeController;

  @override
  void initState(){
    super.initState();
    _fontSizeAnimeController = new AnimationController(duration: new Duration(milliseconds:1000), vsync:this);
    _fontSizeAnime = new CurvedAnimation(parent: _fontSizeAnimeController, curve: Curves.bounceOut);
    _fontSizeAnime.addListener( ()=> this.setState( () {}));
    _fontSizeAnimeController.forward();
  }

  String _question;
  TheState(this._question);
  @override
  Widget build(BuildContext c){
    return new Material(
            child: new Padding(
              padding: new EdgeInsets.symmetric(vertical:10.0),
              child: new Center(child: Text(_question,
              style: new TextStyle(fontSize: _fontSizeAnime.value *15, color: Colors.black, fontWeight:  FontWeight.bold),)
                )
            )
    );
  }
}