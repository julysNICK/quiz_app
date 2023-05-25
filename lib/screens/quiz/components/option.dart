import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../../../constrants.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.selectedAns) {
                return kGreenColor;
              } else {
                return kGrayColor;
              }
            }
            return kGrayColor;
          }

          IconData getTheRightIcon() {
            return index == qnController.selectedAns
                ? Icons.check
                : Icons.close;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: kDefaultPadding / 1.7),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.026),
              decoration: BoxDecoration(
                border: Border.all(color: getTheRightColor()),
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    12,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(
                      fontSize: 16,
                      color: getTheRightColor(),
                    ),
                  ),
                  Container(
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == kGrayColor
                          ? Colors.transparent
                          : getTheRightColor(),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          50,
                        ),
                      ),
                      border: Border.all(
                        color: getTheRightColor(),
                      ),
                    ),
                    child: getTheRightColor() == kGrayColor
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 16,
                            color: Colors.white,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
