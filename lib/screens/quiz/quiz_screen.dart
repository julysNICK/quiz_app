import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/after_quiz/after_quiz_screen.dart';
import 'package:quiz_app/screens/quiz/components/body.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Get.to(AfterQuiz()),
            child: const Text(
              "Pular",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
