import 'package:flutter/material.dart';

class AnswerBtn extends StatelessWidget{
  final String _onScreenText;
  final bool _isRight;
  final VoidCallback _textToPrint;

  AnswerBtn(this._onScreenText, this._isRight ,this._textToPrint);
  Widget build(BuildContext context){
    return new Expanded(
              child: new Material(
                //ternery operator, same as if statment, ":" means else
                color: _isRight == true ? Colors.greenAccent : Colors.redAccent, 
                child: new InkWell(
                  onTap: () => _textToPrint(),
                  child: new Center(
                    child: new Container(
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Colors.white, width: 5.0)
                      ),
                      padding: new EdgeInsets.all(20.0),
                      child: new Text(_onScreenText, 
                      style: new TextStyle(color: Colors.white, fontSize: 45.0, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
                  )//Countainer
                )//center
              )//inkwell
            )//material
          );
  }
  

}
