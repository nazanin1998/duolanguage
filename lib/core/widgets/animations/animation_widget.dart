import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationWidget extends StatefulWidget {
  final String asset;
  final double width;

  const AnimationWidget({super.key, required this.asset, this.width = 300});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
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
        widget.asset,
        width: widget.width,
        repeat: true,
        animate: value,
        onLoaded: (p0) => loading.value = true,
      ),
    );
  }
}
