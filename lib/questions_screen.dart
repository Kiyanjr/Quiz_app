import 'package:flutter/material.dart';
import 'package:quiz_app/answers_button.dart';
import 'package:quiz_app/data/questions.dart';


class QuestionsScreen extends StatefulWidget {

  const QuestionsScreen({required this.selectingAsnwer,super.key});
   //setting value to choose the asnwer to use it in quiz.dart class
    final void Function(String answer) selectingAsnwer;



  @override
  State<QuestionsScreen> createState() {
    return _QuestionsSCreenState();
  }
}

class _QuestionsSCreenState extends State<QuestionsScreen> {
  var currentQuestionTurn = 0;
  //going to next question
 void answerQuestion(String selectedAsnwer) {
//thats how we accsess somting from satateful to our State class
widget.selectingAsnwer(selectedAsnwer);

    setState(() {
       currentQuestionTurn += 1;
    });
   
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionTurn];

    return SizedBox(
      //using as much as we can to take width space
      width: double.infinity,
      child: Container(
        //answers shape have space with the edge
        margin: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //amodi
          crossAxisAlignment: CrossAxisAlignment.stretch, //ofogi
          children: [
            Text( 
              currentQuestion.text,
              style:TextStyle(
              color: Colors.white,
               fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 27),
            //spreading
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswersButton(asnwerText: answer,
               onTap:(){
              answerQuestion(answer);
               }
               );
            }),
          ],
        ),
      ),
    );
  }
}
