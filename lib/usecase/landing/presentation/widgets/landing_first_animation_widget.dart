import 'package:flutter/material.dart';
import 'package:duolingo/core/constants/animations.dart';
import 'package:lottie/lottie.dart';

class LandingFirstAnimationWidget extends StatefulWidget {
  const LandingFirstAnimationWidget({super.key});

  @override
  State<LandingFirstAnimationWidget> createState() =>
      _LandingFirstAnimationWidgetState();
}

class _LandingFirstAnimationWidgetState
    extends State<LandingFirstAnimationWidget> {
  final loading = ValueNotifier<bool>(false);

  @override
  void dispose() {
    loading.value = false;
    loading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: loading,
      builder: (context, value, child) => Lottie.asset(
        Animations.landing,
        width: MediaQuery.of(context).size.width / 3,
        repeat: true,
        animate: value,
        onLoaded: (p0) => loading.value = true,
      ),
    );
  }
}
