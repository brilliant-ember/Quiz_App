import 'package:flutter/material.dart';
import "dart:math";

class ResponceOverlay extends StatefulWidget{
  final bool _isRight;

  ResponceOverlay(this._isRight);

@override
State<StatefulWidget> createState() { // could have used => instead of return
    return new ResponceOverlayState();
  }
}

class ResponceOverlayState extends State<ResponceOverlay> with SingleTickerProviderStateMixin{
  Animation<double> _iconAnime;
  AnimationController _iconAnimeCont;
  @override
  void initState() {
      // TODO: implement initState
      super.initState();
      _iconAnimeCont = new AnimationController(duration: new Duration(seconds: 2), vsync: this);
      _iconAnime = new CurvedAnimation(parent:_iconAnimeCont, curve: Curves.elasticOut);
      _iconAnime.addListener(() => this.setState( () {}));
      _iconAnimeCont.forward();
    }


  @override
  Widget build(BuildContext c){
    return new Material(
      color: Colors.black45,
      child: new InkWell(
        onTap: () => print("You tapped the overlay"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                angle: _iconAnime.value * 4 * PI, 
                child: new Icon(widget._isRight ? Icons.done : Icons.close, size: _iconAnime.value * 80.0),
              ),
            ),
            new Padding(padding: new EdgeInsets.only(bottom: 5.0)),
            new Text(widget._isRight ? "Yup!" : "Nope", style: new TextStyle(color: Colors.white , fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}