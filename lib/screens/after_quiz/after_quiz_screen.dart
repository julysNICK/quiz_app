import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';

class AfterQuiz extends StatelessWidget {
  const AfterQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const Spacer(
                flex: 3,
              ),
              Text(
                "Score",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: kBlackColor,
                      fontSize: 50,
                    ),
              ),
              const Spacer(),
              Text(
                "${questionController.correctAns * 10}/${questionController.questions.length * 10}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: kBlackColor,
                      fontSize: 80,
                    ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
