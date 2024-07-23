import 'package:flutter/material.dart';

import '../constants/colors.dart';

class LinearGradientColorHelper extends StatelessWidget {
  const LinearGradientColorHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            deeperPurple,
            deepPurple,
            lightPurple,
            lighterPurple,
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            30,
          ),
          bottomRight: Radius.circular(
            30,
          ),
        ),
      ),
    );
  }
}

class FixedBgColorWithConerRadiusWidgetHelper extends StatelessWidget {
  const FixedBgColorWithConerRadiusWidgetHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
       color: deeperPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            30,
          ),
          bottomRight: Radius.circular(
            30,
          ),
        ),
      ),
    );
  }
}

class LinearGradientColor extends StatelessWidget {
  const LinearGradientColor({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            Color(0xff663091),
            Color(0xff712f8a),
            Color(0xff7d2e81),
            Color(0xff8e2d75),
          ],
        ),
      ),
    );
  }
}
