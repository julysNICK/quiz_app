import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/progress_bar.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constrants.dart';
import 'questionCard.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Stack(
      children: [
        WebsafeSvg.asset(
          "assets/icons/bg.svg",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              const SizedBox(
                height: kDefaultPadding,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(() => Text.rich(
                      TextSpan(
                        text:
                            "Question ${questionController.questionNumber.value}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: kSecondaryColor),
                        children: [
                          TextSpan(
                            text: "/${questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: kSecondaryColor),
                          ),
                        ],
                      ),
                    )),
              ),
              const Divider(
                thickness: 1.5,
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: questionController.pageController,
                  onPageChanged: questionController.updateTheQnNum,
                  itemCount: questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: questionController.questions[index],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
