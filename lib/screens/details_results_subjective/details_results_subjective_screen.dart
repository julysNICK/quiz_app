import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';
import '../../controllers/question_controller.dart';
import '../../models/Question.dart';

class DetailsResultsSubjective extends StatefulWidget {
  const DetailsResultsSubjective({super.key});

  @override
  State<DetailsResultsSubjective> createState() =>
      _DetailsResultsSubjectiveState();
}

class _DetailsResultsSubjectiveState extends State<DetailsResultsSubjective> {
  QuestionController questionController = Get.put(QuestionController());
  List<dynamic> newList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    questionController.getAnswerSubjectiveFireBase().then((value) {
      setState(() {
        newList = value;
      });
    });
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
          ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Center(
                    child: Text("Perguntas e respostas",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
              subjectiveQuestions.isEmpty && newList.isEmpty
                  ? const Center(
                      child: Text("Sem dados",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: subjectiveQuestions.length,
                      itemBuilder: (context, index) {
                        // return buildCard(
                        //     context, sample_data[index], newList[index]);
                        if (index >= 0 &&
                            index < subjectiveQuestions.length &&
                            index < newList.length) {
                          return buildCard(context, subjectiveQuestions[index],
                              newList[index]);
                        } else {
                          return null;
                        }
                      },
                    ),
            ],
          )
        ],
      ),
    );
  }

  Padding buildCard(BuildContext context, SubjectiveQuestion question,
      Map<String, dynamic> newList) {
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
                  ? newList['answers']
                      .map<Widget>((answer) => ListTile(
                            title: Text(answer),
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
