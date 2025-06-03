import 'package:flutter/material.dart';
class AnswersButton extends StatelessWidget {
const AnswersButton({super.key,required this.asnwerText,required this.onTap,});
 
 final String asnwerText;
final void Function() onTap;//we recibe as argument and use as value in press

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed:onTap,
      style: ElevatedButton.styleFrom(
        //padding: EdgeInsets.all(), for addin space in our bottum and answers 
        backgroundColor:  const Color.fromARGB(255, 240, 235, 237),
        foregroundColor: const Color.fromARGB(255, 0, 0, 0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(23)),
        ),
      child:Text(asnwerText,textAlign:TextAlign.center),
      
  );

  }
}