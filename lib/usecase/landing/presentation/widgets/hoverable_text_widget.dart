import 'package:duolingo/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/sizes.dart';
import '../cubits/hover_cubit.dart';
import '../cubits/hover_state.dart';

class HoverableTextWidget extends StatefulWidget {
  final String text;
  final Function(bool)? onHover;

  const HoverableTextWidget({super.key, required this.text, this.onHover});

  @override
  State<HoverableTextWidget> createState() => _HoverableTextWidgetState();
}

class _HoverableTextWidgetState extends State<HoverableTextWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (isHovered) {
        if (widget.onHover != null) {
          widget.onHover!(isHovered);
        }
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onTap: () {},
      child: BlocBuilder<HoverCubit, HoverState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.all(Sizes.mediumMargin),
          child: Row(
            children: [
              Text(
                widget.text,
                style: state.isHovered
                    ? Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: AppColors.textLightGray)
                    : Theme.of(context).textTheme.headlineMedium,
              ),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: state.isHovered
                    ? AppColors.textLightGray
                    : AppColors.textGray,
              )
            ],
          ),
        ),
      ),
    );
  }
}
