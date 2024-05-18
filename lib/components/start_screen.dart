import 'package:flutter/material.dart';
// import 'package:quiz_app/components/quiz.dart';
import 'package:feedback_app/components/quiz_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  // var screen="start-screen";

  // void switchScreen()
  // {
  //   setState(
  //     (){
  //       screen="questions-screen";
  //     }
  //   )

  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz_app',
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/quiz-logo.png', width: 200,color: const Color.fromARGB(126, 255, 255, 255),),
              const SizedBox(height: 50),
              const Text('Feedback Form',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              const SizedBox(height: 50),
              ElevatedButton.icon(
                icon:const Icon(Icons.arrow_right_alt),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const QuizScreen()));
                },
                label: const Text("Start"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
