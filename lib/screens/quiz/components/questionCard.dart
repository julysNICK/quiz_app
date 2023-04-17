import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constrants.dart';
import '../../../controllers/question_controller.dart';
import '../../../models/Question.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            25,
          ),
        ),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: kBlackColor,
                  fontSize: 25,
                ),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => questionController.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
