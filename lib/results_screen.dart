import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary/questions_summary.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({required this.chosenASnwers,required this.onRestart, super.key});

  final List<String> chosenASnwers;
final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenASnwers.length; i++) {
      //creating map by writing {} in our add()
      summary.add({
        //value first key second.
        'question-index': i,
        'question': questions[i].text,
        'correct-answer':questions[i].answers[0],
        'user-answer':chosenASnwers[i],
      });
    } 
    return summary;
  }

  @override
  Widget build(BuildContext context) {
final summaryData=getSummaryData();
final numTotalQuestions=questions.length;
final numCorrectQuestions=summaryData.where((data) {
  return data['user-answer']==data['correct-answer'];
}).length;//iterable obj

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You asnwered $numCorrectQuestions out of $numTotalQuestions questions correctly!',            
         style:TextStyle (
                color: const Color.fromARGB(255, 230, 200, 253),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
         const  SizedBox(height: 30),
         
        QuestionsSummary(summaryData),

            SizedBox(height: 30),
           TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            )
          ],
        ),
      ),
    );
  }
}
