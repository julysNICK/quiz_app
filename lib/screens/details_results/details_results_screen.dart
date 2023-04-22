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
              buildCard(context,
                  title:
                      "Em geral, como você se sente em relação ao seu trabalho?"),
              buildCard(context,
                  title:
                      'Você se sente valorizado e reconhecido pela empresa?'),
              buildCard(context,
                  title:
                      'Você se sente motivado para realizar suas tarefas diárias?'),
              buildCard(context,
                  title:
                      'Você se sente confiante em relação ao seu futuro na empresa?'),
              buildCard(context,
                  title:
                      'Você acha que as informações importantes são comunicadas de forma clara e eficaz?'),
              buildCard(context,
                  title:
                      'Você tem acesso às informações necessárias para realizar seu trabalho?'),
              buildCard(context,
                  title:
                      'Você se sente confortável para expressar suas ideias e opiniões no ambiente de trabalho?'),
              buildCard(context,
                  title:
                      'A empresa ouve e responde às suas sugestões e comentários?'),
              buildCard(context,
                  title:
                      ' Você acredita que seus superiores são competentes e capazes de liderar a equipe?'),
              buildCard(context,
                  title: 'Eles fornecem orientação e apoio quando necessário?'),
            ],
          )
        ],
      ),
    );
  }

  Padding buildCard(BuildContext context, {String title = ""}) {
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
              title,
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
