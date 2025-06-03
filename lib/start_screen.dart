import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // logo miyadd paeen tar as navar bala
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 195,
            color: const Color.fromARGB(123, 250, 250, 250),
          ),
          //space between image and bottum
          const SizedBox(height: 200),
          Text(
            'Welcome to the Quiz game.',
            style: TextStyle(
              color: Color.fromARGB(255, 60, 142, 219),
              fontSize: 20,
            ),
          ),
          ElevatedButton.icon(
            onPressed: startQuiz, //value for press
            icon: Icon(Icons.add_circle),
            label: const Text('Press here'),
            style: ElevatedButton.styleFrom(textStyle: TextStyle(fontSize: 28)),
          ),
        ],
      ),
    );
  }
}
