import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
   @override
  State<Quiz> createState(){
   
    return _QuizState();
  }
}


class _QuizState extends State<Quiz>{
  List <String> selectedAnswers=[];
  var activeScreen='start_screen';

void switchScreen(){
setState(() {
  activeScreen='question_screen';
});
}
void chooseAnswer(String answer){
  selectedAnswers.add(answer);
if(selectedAnswers.length==questions.length){
  setState(() {
    activeScreen='results_screen';
  });
}
}
void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions_screen';
    });
  }
 

  @override
  Widget build(BuildContext context) {

   Widget screenWidget=StartScreen(switchScreen);
   if(activeScreen=='question_screen'){
    screenWidget=QuestionsScreen(selectingAsnwer: chooseAnswer
    );
   }
 
 if (activeScreen == 'results_screen') {
      screenWidget = ResultsScreen(
        chosenASnwers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }  
    return MaterialApp(
      home: Scaffold( 
   body: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors:[
      const Color.fromARGB(239, 57, 25, 112),
      const Color.fromARGB(255, 112, 73, 217),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      )
    ),
    child:screenWidget,
   ),
      ),
    );
  }
  }
