import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/details_results/details_results_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../details_results_subjective/details_results_subjective_screen.dart';

class Typequestion extends StatelessWidget {
  const Typequestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Type question"),
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
              buildCardType('Perguntas objetivas', const DetailsResults()),
              buildCardType(
                  'Perguntas subjetivas', const DetailsResultsSubjective()),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCardType(String s, Widget screen) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            onTap: () => Get.to(() => screen),
            title: Text(s),
            subtitle: const Text('Ver resultados'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      );
}
