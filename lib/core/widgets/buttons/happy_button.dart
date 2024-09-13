import 'package:duolingo/core/constants/colors.dart';
import 'package:duolingo/core/constants/sizes.dart';
import 'package:flutter/material.dart';


class HappyButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const HappyButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_shadowButton, _button],
    );
  }

  Widget get _button => Builder(
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: AppColors.mainGreen,
            borderRadius: Sizes.primaryBorder,
          ),
          height: Sizes.btnHeight,
          width: Sizes.btnWidth,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: Sizes.primaryBorder,
              hoverColor: AppColors.lightGreen,
              onTap: onTap,
              child: Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _shadowButton => Builder(
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: AppColors.shadowGreen,
            borderRadius: BorderRadius.circular(Sizes.btnShadowRadius),
          ),
          height: Sizes.btnHeight + Sizes.btnShadowHeight,
          width: Sizes.btnWidth,
        ),
      );
}
