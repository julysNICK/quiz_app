import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constrants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: const Color(0xff3f4768)),
      ),
      child: Stack(
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth * 0.2,
              decoration: const BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
            );
          }),
          Positioned.fill(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "10 sec",
                    style: TextStyle(color: Colors.white),
                  ),
                  WebsafeSvg.asset("assets/icons/clock.svg"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
