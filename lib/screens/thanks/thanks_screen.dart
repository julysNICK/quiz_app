import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';

class Thanks extends StatefulWidget {
  String titleButton = "Concluir questionário";
  Thanks({super.key, this.titleButton = "Concluir questionário"});

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
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
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Text(
                    "Todos as perguntas respondidas foram salvas!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: kGrayColor,
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child:
                        Text("Obrigado por participar do nosso questionário!",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: kGrayColor,
                            )),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/");
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: 10),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: 10),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.titleButton,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
