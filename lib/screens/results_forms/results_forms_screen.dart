import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/details_results/details_results_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ResultsForms extends StatelessWidget {
  const ResultsForms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("ResultsForms"),
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
              buildCard(
                'Formulário 1',
              ),
              buildCard(
                'Formulário 1',
              ),
              buildCard(
                'Formulário 1',
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildCard(String s) => Padding(
        padding: const EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            onTap: () => Get.to(() => const DetailsResults()),
            title: const Text('Formulário 1'),
            subtitle: const Text('Descrição do formulário 1'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      );
}
