import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget{
  final String question;
  QuestionText(this.question);
  @override
    State<StatefulWidget> createState() {
      return new TheState();
    }
}

class TheState extends State<QuestionText> with SingleTickerProviderStateMixin{
  Animation<double> _fontSizeAnime;
  AnimationController _fontSizeAnimeController;

  @override
  void initState(){
    super.initState();
    _fontSizeAnimeController = new AnimationController(duration: new Duration(milliseconds:700), vsync:this);
    _fontSizeAnime = new CurvedAnimation(parent: _fontSizeAnimeController, curve: Curves.bounceOut);
    _fontSizeAnime.addListener( ()=> this.setState( () {}));
    _fontSizeAnimeController.forward();
  }

  @override
  void @override
    void didUpdateWidget(QuestionText oldWidget) {
      // TODO: implement didUpdateWidget
      super.didUpdateWidget(oldWidget);
      if (oldWidget.question != widget.question){
        _fontSizeAnimeController.reset();
        _fontSizeAnimeController.forward();
      }
    }

  @override
  Widget build(BuildContext c){
    return new Material(
            child: new Padding(
              padding: new EdgeInsets.symmetric(vertical:10.0),
              child: new Center(child: Text(widget.question,
              style: new TextStyle(fontSize: _fontSizeAnime.value *15, color: Colors.black, fontWeight:  FontWeight.bold),)
                )
            )
    );
  }
}