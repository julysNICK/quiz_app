import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';
import '../../controllers/question_controller.dart';
import '../../models/Question.dart';

class DetailsResults extends StatefulWidget {
  const DetailsResults({super.key});

  @override
  State<DetailsResults> createState() => _DetailsResultsState();
}

class _DetailsResultsState extends State<DetailsResults> {
  QuestionController questionController = Get.put(QuestionController());
  List<dynamic> newList = [];

  Future<List<dynamic>> getQuestions() async {
    await questionController.getAnswerFireBase().then((value) {
      newList = value;
    });
    return newList;
  }

  String formmatString(String string) {
    switch (string) {
      case 'concordo':
        return 'Concordo';
      case 'concordo_parcialmente':
        return 'Concordo parcialmente';
      case 'nao_concordo':
        return 'Não concordo';
      case 'nao_concordo_parcialmente':
        return 'Não concordo parcialmente';
      case 'neutro':
        return 'Neutro';
      default:
        return 'Não respondido';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Detalhes dos resultados"),
        backgroundColor: Colors.grey[900]!.withOpacity(0.8),
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebsafeSvg.asset(
            "assets/icons/bg.svg",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
          ),
          // ListView(
          //   children: [
          //     const Padding(
          //       padding: EdgeInsets.only(top: 20, bottom: 10),
          //       child: Center(
          //           child: Text("Perguntas e respostas",
          //               style: TextStyle(
          //                   fontSize: 20, fontWeight: FontWeight.bold))),
          //     ),
          //     sample_data.isEmpty && newList.isEmpty
          //         ? const Center(
          //             child: Text("Sem dados",
          //                 style: TextStyle(
          //                     fontSize: 20, fontWeight: FontWeight.bold)))
          //         : ListView.builder(
          //             shrinkWrap: true,
          //             physics: const NeverScrollableScrollPhysics(),
          //             itemCount: sample_data.length,
          //             itemBuilder: (context, index) {
          //               if (index >= 0 &&
          //                   index < sample_data.length &&
          //                   index < newList.length) {
          //                 return buildCard(
          //                     context, sample_data[index], newList[index]);
          //               } else {
          //                 return null;
          //               }
          //             },
          //           ),
          //   ],
          // )

          FutureBuilder(
            builder: (context, snap) {
              if (snap.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snap.connectionState == ConnectionState.done) {
                if (snap.hasData) {
                  return ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 10),
                        child: Center(
                            child: Text("Perguntas e respostas",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snap.data?.length,
                        itemBuilder: (context, index) {
                          if (index >= 0 &&
                              index < sample_data.length &&
                              index < newList.length) {
                            return buildCard(
                                context, sample_data[index], newList[index]);
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text("Sem dados",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  );
                }
              } else {
                return const Center(
                  child: Text("Sem dados",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                );
              }
            },
            future: getQuestions(),
          )
        ],
      ),
    );
  }

  Padding buildCard(
      BuildContext context, Question question, Map<String, dynamic> newList) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: Card(
        color: kSecondaryColor,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
          ),
          header: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              question.question,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          collapsed: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Ver Respostas'),
          ),
          expanded: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: newList.isNotEmpty
                  ? newList.entries
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: e.key != '_id'
                                      ? Text(
                                          '${formmatString(e.key)}: ${e.value.toString()}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        )
                                      : Container(),
                                ),
                              ],
                            ),
                          ))
                      .toList()
                  : [const Text('Sem respostas')],
            ),
          ),
        ),
      ),
    );
  }
}
