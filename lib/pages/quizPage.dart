import "package:flutter/material.dart";
import "package:app/utils/quiz.dart";
import "package:app/UI/AnswerBtn.dart";
import 'package:app/UI/questionText.dart';
import 'package:app/UI/responceOverlay.dart';

class QuizPage extends StatefulWidget {
  // stateful widget needs a state, that's y I made
  // the QuizPageState class
  @override
  State createState() => new QuizPageState();
}

// the state class
class QuizPageState extends State<QuizPage> {
  Question currentQ;
  String qText;
  int qNum;
  bool isCorrect;
  bool overlay=false;
  Quiz quiz = new Quiz([
    new Question("Can humans fly?", false),
    new Question("Is English spoken in Canada?", true),
    new Question("Is my name Mo?", true)
  ]); 

  @override
  void initState(){
    super.initState();
    currentQ = quiz.nextQuestion;
    qText = currentQ.question;
    qNum = quiz.numberOfQuestions;
  }
  
  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
             new AnswerBtn( "Right!", true, (){handleAnswer(true);
             }),
             new QuestionText(qText),
             new AnswerBtn("Wrong!", false, (){handleAnswer(false);} ),
        ],//childeren
      ),//column
      overlay ? new ResponceOverlay(isCorrect, (){
       currentQ = quiz.nextQuestion;
        this.setState((){
          overlay = false;
          qText = currentQ.question;});

      }) : new Container()
      ],
    );
  }

  void handleAnswer(bool answer){
    isCorrect = currentQ.answer == answer;
    quiz.isRightanswer(isCorrect);
    this.setState(() {
      overlay = true;

    });
  }

}
