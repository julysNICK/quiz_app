import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';
import '../quiz/quiz_screen.dart';
import '../results_forms/results_forms_screen.dart';

class Choose extends StatelessWidget {
  const Choose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  Text(
                    "Formulários online",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "Escolha uma das opções abaixo para continuar",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Container(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const ResultsForms()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Ver resultados dos questionários",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => const QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        gradient: kSecondaryGradient,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Text(
                        "Responder questionário",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
