import 'package:flutter/material.dart';

class LargeTitleText extends StatelessWidget {
  final String text;
  const LargeTitleText({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
