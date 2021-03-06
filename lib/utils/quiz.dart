//the Question of object
class Question{
  final String question;
  final bool answer;
  Question(this.question, this.answer);
}

//The quiz that uses question objects
class Quiz{
  List<Question> _questions;
  int _currentQuestionNo = -1 ; // the index of the current Q
  int _score = 0;
  String _title; //the title of the quiz
  
  //constractor
  Quiz(this._questions, this._title){
    _questions.shuffle();
  }

  //getters
  int get score => _score;
  List<Question> get question =>_questions;
  int get numberOfQuestions => _questions.length;
  int get curentQuestion => _currentQuestionNo + 1 ;
  String get quizTitle => _title;

  //setters
  void  setTitle(String s){
  _title =s;
  }
  void addQuestion(Question q){
    _questions.add(q);
    _questions.shuffle();
  }

  Question get nextQuestion{
    _currentQuestionNo++;
    //if the current question is higher or equal the no of Q,
    //then there's no next Q
    if (_currentQuestionNo >= numberOfQuestions) return null;
    return _questions[_currentQuestionNo];
  }
  
  void isRightanswer(bool isCorrect){
    if (isCorrect) _score++;
  }

}