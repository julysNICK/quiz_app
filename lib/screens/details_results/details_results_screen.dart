import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constrants.dart';

class DetailsResults extends StatelessWidget {
  const DetailsResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("DetailsResults"),
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
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
              buildCard(context),
            ],
          )
        ],
      ),
    );
  }

  Padding buildCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10),
      child: Card(
        color: kSecondaryColor,
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapBodyToCollapse: true,
          ),
          header: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Em geral, como você se sente em relação ao seu trabalho?',
              style: TextStyle(
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
            child: Text(
              List.generate(5, (index) => 'Resposta A: 5').join('\n\n'),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
