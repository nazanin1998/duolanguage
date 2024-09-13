import 'package:flutter/material.dart';


class MediumHeadLineText extends StatelessWidget {

  final String text;

  const MediumHeadLineText({super.key, required this.text,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
