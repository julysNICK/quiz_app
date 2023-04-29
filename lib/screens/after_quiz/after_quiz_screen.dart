import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';
import '../../models/Question.dart';

class AfterQuiz extends StatefulWidget {
  const AfterQuiz({super.key});

  @override
  State<AfterQuiz> createState() => _AfterQuizState();
}

class _AfterQuizState extends State<AfterQuiz> {
  final _formKey = GlobalKey<FormState>();
  SubjectiveRepo subjectiveRepoObj = SubjectiveRepo();
  Future<void> createSubjectiveAnswer(
      QuestionController questionController) async {
    if (_formKey.currentState!.validate()) {
      try {
        await questionController
            .postAnswerSubjectiveFireBase(subjectiveRepoObj);
        Get.snackbar(
          "Obrigado!",
          "Sua resposta foi enviada com sucesso!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
        // Get.to(() => const Choose());
      } catch (e) {
        Get.snackbar(
          "Erro!",
          "Não foi possível enviar sua resposta!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.15;
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text.rich(
                      TextSpan(
                        text: "Quase lá!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: kSecondaryColor),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1.5,
                  ),
                  Expanded(
                    child: Container(
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
                            "Você tem alguma sugestão ou comentário para melhorar o clima organizacional na empresa?",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  color: kBlackColor,
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.025,
                                ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: containerHeight,
                            child: TextFormField(
                              textAlignVertical: TextAlignVertical.top,
                              onChanged: (value) {
                                setState(() {
                                  containerHeight =
                                      MediaQuery.of(context).size.height * 0.5;

                                  subjectiveRepoObj.answer = value;
                                });
                              },
                              expands: true,
                              maxLines: null,
                              minLines: null,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 1),
                                hintText: 'Digite aqui',
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Color(0xFF1C2341),
                              ),
                              strutStyle: const StrutStyle(
                                height: 1.5,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Por favor, digite algo';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: kDefaultPadding * 2,
                                vertical: kDefaultPadding,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await createSubjectiveAnswer(
                                    questionController);
                              } catch (e) {
                                print(e);
                              }
                            },
                            child: const buttonTextFInish(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class buttonTextFInish extends StatelessWidget {
  const buttonTextFInish({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: const Text(
        "Concluir questionário",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
