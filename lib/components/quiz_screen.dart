import "package:flutter/material.dart";
import "package:feedback_app/data/questions.dart";
import 'package:feedback_app/components/results_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  var questionIndex = 0;

  final feedbackChoices = ["Very good", "Good", "Average", "Poor", "Very poor"];

  final List<String?> selectedAnswers = List.filled(questions.length, null);

  void nextQuestion() {
    setState(() {
      if (questionIndex < questions.length - 1) {
        questionIndex++;
      } else if (selectedAnswers.contains(null)) {
        Fluttertoast.showToast(
            msg: "Please answer all questions",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ResultsScreen(choices:selectedAnswers.whereType<String>().toList())));
      }
    });
  }

  void prevQuestion() {
    setState(() {
      if (questionIndex != 0) {
        questionIndex--;
      }
    });
  }

  void selectAnswer(String item) {
    setState(() {
      selectedAnswers[questionIndex] = item;
    });
  }

  // var _index = 0;
  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(80),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Text('${questions.length}'),
                // Container(
                //   margin: const EdgeInsets.all(20),
                //   child:Text('$questionIndex.${currentQuestion.question}'),
                // ),
                // for(var curr in questionData.length)
                // ElevatedButton(onPressed: (){}, child: const Text("hello")),

                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {
                //         if(_index<=questionList.length)
                //         _index++;
                //       });
                //     },
                //     child: const Text("Next"))
                Text(
                  '$questionIndex.${currentQuestion.question}',
                  textAlign: TextAlign.center,
                ),
                ...feedbackChoices.map((item) {
                  return ElevatedButton(
                    onPressed: () => selectAnswer(item),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedAnswers[questionIndex] == item
                          ? Colors.green
                          : null,
                    ),
                    child: Text(item),
                  );
                }),

                Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      ElevatedButton(
                          onPressed: prevQuestion, child: const Text("Prev")),
                      const SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: nextQuestion, child: const Text("Next")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
