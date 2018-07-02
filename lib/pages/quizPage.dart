import "package:flutter/material.dart";
import "package:app/utils/quiz.dart";
import "package:app/UI/AnswerBtn.dart";
import 'package:app/UI/questionText.dart';
import 'package:app/UI/responceOverlay.dart';
import 'package:app/pages/scorePage.dart';
//these imports are for the firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

List<Quiz> allQuizzes= [Quiz([
  Question ("Is AI the same thing as machine learning?", false),
  Question("Is AI going to rule over humanity", false),
  Question("AI is a programming techinque", true),
  Question  ("AI has been around for more than a decade", true),
  Question("AI has a lot of applications", true)
], "Test Quiz")];

///////Here is the data base schinanigens
// final FirebaseApp app = FirebaseApp(
//   name:
//   options: FirebaseOptions(
//     googleAppID:'quizapp-c7453',
//     apiKey: 'AIzaSyCmfCYfEQKau_FB8k7LJE0NR16EqNt-Wsg',
//     databaseURL: 'https://quizapp-c7453.firebaseio.com',
//      )
// );





///////////these are the functoanlity of the quiz page
class QuizPage extends StatefulWidget {
  // stateful widget needs a state, that's y I made
  // the QuizPageState class
  @override
  State createState() => new QuizPageState();
}

// the state class
class QuizPageState extends State<QuizPage> {
  //List<Quiz> allQuizzes;
  Question currentQ;
  String qText;
  int qNum;
  bool isCorrect;
  bool overlay=false;
  // Quiz quiz = new Quiz([
  //   new Question("Can humans fly?", false),
  //   new Question("Is English spoken in Canada?", true),
  //   new Question("Is my name Mo?", true)
  // ]); 

  Quiz quiz = allQuizzes[0];


  @override
  void initState(){
    super.initState();
    currentQ = quiz.nextQuestion;
    qText = currentQ.question;
    qNum = quiz.numberOfQuestions;
  }
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      
      appBar: AppBar(title: Text(quiz.quizTitle),
      centerTitle: true,
      ),
      body: Stack(
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
        if (currentQ == null){
          Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.numberOfQuestions)), (Route route)=> route == null);
          return; //  returning nothing so that the SetState does not get invoked
        }
        this.setState((){
          overlay = false;
          qText = currentQ.question;});

      }) : new Container()
      ],
    ),
    drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Settings",),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("MAKE"),
            trailing: Icon(Icons.save),
            onTap: makeButton,
          ),
          ListTile(
            title: Text("LOAD"),
            trailing: Icon(Icons.label),
            onTap: loadButton,
          )
        ],
      ),
    ),
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

void makeButton(){print("object");}
void loadButton(){print("load");}

//this item will be passed to the Database
// class Item{
//   String key, title, body;

//   Item(this.title, this.body);

//   //this is similar to a map or a dictionary obj for JSON and will allow us
//   //to get our data from the DB, I am getting a snapshot
//   //from the db and then I am parsing that into the data I want
//   Item.fromSnapshot(DataSnapshot snapshot)
//     :key = snapshot.key,
//     title = snapshot.value["title"],
//     body = snapshot.value["body"];

//   toJson(){
//     return {
//       "title": title,
//       "body": body,
//       };
//     }
  

// }