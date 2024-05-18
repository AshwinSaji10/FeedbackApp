import 'package:flutter/material.dart';
import 'package:feedback_app/components/start_screen.dart';

class Quiz extends StatelessWidget {
  const Quiz({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      // theme: ThemeData( scaffoldBackgroundColor: Colors.lightGreenAccent,),
      debugShowCheckedModeBanner: false,
      home: StartScreen()
    );
  }
}


// decoration: const BoxDecoration(
//             color: Colors.deepPurple,
