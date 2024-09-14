import 'package:duolingo/core/constants/colors.dart';
import 'package:duolingo/core/widgets/buttons/neutral_button.dart';
import 'package:duolingo/usecase/landing/presentation/cubits/hover_cubit.dart';
import 'package:duolingo/usecase/landing/presentation/cubits/hover_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/medias.dart';
import '../../../../core/widgets/buttons/happy_button.dart';
import '../widgets/language_slider_widget.dart';
import '../widgets/landing_first_animation_widget.dart';
import '../widgets/hoverable_text_widget.dart';
import '../widgets/language_list_widget.dart';
import '../widgets/notched_overlay_widget.dart';

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HoverCubit, HoverState>(
      listener: (context, state) {
        if (state.isHovered) {
          _showOverlay(context);
          return;
        }
        if (!state.isHovered) {
          _removeOverlay();
          return;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            _body,
            _header,
          ],
        ),
      ),
    );
  }

  Widget get _body => SingleChildScrollView(
        child: Column(
          children: [
            _bodyPageOne,
          ],
        ),
      );

  Widget get _bodyPageOne => Builder(
      builder: (context) => SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: Sizes.appbarHeight),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const LandingFirstAnimationWidget(),
                    Column(
                      children: [
                        _description,
                        SizedBox(height: Sizes.largeMargin),
                        _startBtn,
                        SizedBox(height: Sizes.mainMargin),
                        _haveAccountBtn,
                      ],
                    ),
                  ],
                ),
                const LanguageSliderWidget()
              ],
            ),
          ));

  Widget get _haveAccountBtn => Builder(builder: (context) {
        return NeutralButton(
          text: AppLocalizations.of(context)!.haveAccount,
          onTap: () {
            //todo
          },
        );
      });

  Widget get _startBtn => Builder(builder: (context) {
        return HappyButton(
          text: AppLocalizations.of(context)!.getStarted,
          onTap: () {
            //todo
          },
        );
      });

  Widget get _header => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: Sizes.mainMargin),
          Builder(
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 6,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_logo, _language],
              ),
            ),
          ),
          SizedBox(height: Sizes.mainMargin),
          Divider(
            color: AppColors.neutralGray,
            height: 2,
          )
        ],
      );

  final OverlayEntry _overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: Sizes.appbarHeight / 6 * 5 + Sizes.mediumMargin / 2,
      right: MediaQuery.of(context).size.width / 6,
      child: MouseRegion(
        onEnter: (event) {
          context.read<HoverCubit>().setHoverState(true);
        },
        onExit: (s) {
          context.read<HoverCubit>().setHoverState(false);
        },
        child: NotchedOverlayWidget(
          filledColor: AppColors.white,
          borderColor: AppColors.neutralGray,
          child: const LanguageListWidget(),
        ),
      ),
    ),
  );

  void _showOverlay(BuildContext context) {
    Overlay.of(context).insert(_overlayEntry);
  }

  void _removeOverlay() {
    _overlayEntry.remove();
  }

  Widget get _language => Builder(
        builder: (context) => HoverableTextWidget(
          text: AppLocalizations.of(context)!.siteLanguage,
          onHover: (bool isTextHovered) {
            context.read<HoverCubit>().setHoverState(isTextHovered);
          },
        ),
      );

  Widget get _logo => SvgPicture.asset(
        Medias.logoWithName,
        height: Sizes.logoHeight,
      );

  Widget get _description => Builder(
      builder: (context) => ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width / 3,
            ),
            child: Text(
              AppLocalizations.of(context)!.landingDescription,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ));
}
