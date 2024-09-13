
import 'package:flutter/material.dart';
import 'package:duolingo/core/constants/animations.dart';
import 'package:lottie/lottie.dart';

class LandingFirstAnimationWidget extends StatelessWidget {
  const LandingFirstAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      Animations.landing,
      width: MediaQuery.of(context).size.width / 3,
      repeat: true,
    );
  }
}
