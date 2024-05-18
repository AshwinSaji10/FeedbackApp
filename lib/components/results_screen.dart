import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> choices;
  const ResultsScreen({Key? key, required this.choices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your Responses are:",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              ...choices.map((item) {
                return Text(item,style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,));
              })
            ],
          ),
        ),
      ),
    );
  }
}
