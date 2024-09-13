import 'package:duolingo/core/constants/colors.dart';
import 'package:duolingo/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class NeutralButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const NeutralButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _shadowButton,
        _button,
      ],
    );
  }

  Widget get _button => Container(
        margin: EdgeInsets.all(Sizes.btnBorderWidth),
        decoration: BoxDecoration(
          color: AppColors.white,
          backgroundBlendMode: BlendMode.srcATop,
          borderRadius: Sizes.primaryBorder,
        ),
        height: Sizes.btnHeight,
        width: Sizes.btnWidth - Sizes.btnBorderWidth * 2,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: Sizes.primaryBorder,
            onTap: onTap,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: Sizes.mainFont,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blue,
                ),
              ),
            ),
          ),
        ),
      );

  Widget get _shadowButton => Builder(
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: AppColors.neutralGray,
            borderRadius: BorderRadius.circular(Sizes.btnShadowRadius),
          ),
          height:
              Sizes.btnHeight + Sizes.btnShadowHeight + Sizes.btnBorderWidth,
          width: Sizes.btnWidth,
        ),
      );

}
