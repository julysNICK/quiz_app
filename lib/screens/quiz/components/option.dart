import 'package:flutter/material.dart';

import '../../../constrants.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kDefaultPadding),
      padding: const EdgeInsets.all(kDefaultPadding / 1.5),
      decoration: BoxDecoration(
        border: Border.all(color: kGrayColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "1. Test",
            style: TextStyle(
              fontSize: 16,
              color: kGrayColor,
            ),
          ),
          Container(
            height: 26,
            width: 26,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  50,
                ),
              ),
              border: Border.all(
                color: kGrayColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
