import 'package:flutter/material.dart';

import '../../../constrants.dart';
import '../../../models/Question.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            sample_data[0].question,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: kBlackColor),
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          const Option(),
          const Option(),
          const Option(),
          const Option(),
          const Option(),
        ],
      ),
    );
  }
}
