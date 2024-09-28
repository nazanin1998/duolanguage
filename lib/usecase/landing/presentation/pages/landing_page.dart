import 'package:duolingo/core/constants/animations.dart';
import 'package:duolingo/core/constants/colors.dart';
import 'package:duolingo/core/constants/fonts.dart';
import 'package:duolingo/core/widgets/buttons/neutral_button.dart';
import 'package:duolingo/usecase/landing/presentation/cubits/hover_cubit.dart';
import 'package:duolingo/usecase/landing/presentation/cubits/hover_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/medias.dart';
import '../../../../core/widgets/buttons/happy_button.dart';
import '../../../responsive/presentation/widgets/responsive_wrapper.dart';
import '../widgets/language_slider_widget.dart';
import '../../../../core/widgets/animations/animation_widget.dart';
import '../widgets/hoverable_text_widget.dart';
import '../widgets/language_list_widget.dart';
import '../widgets/notched_overlay_widget.dart';

part './landing_page_mobile.dart';

part './landing_page_web.dart';

part './landing_page_tablet.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper(
      mobileWidget: const _LandingPageMobile(),
      tabletWidget: const _LandingPageTablet(),
      webWidget: _LandingPageWeb(),
    );
  }
}

Widget get _freeFunTextWidget => Builder(
    builder: (context) => Container(
          color: Colors.amber,
          width: MediaQuery.of(context).size.width / 3,
          child: Column(
            children: [
              Text(
                AppLocalizations.of(context)!.learningIsFunTitle,
                style: TextStyle(
                  color: AppColors.mainGreen,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.extraLargeTitleFont,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLocalizations.of(context)!.learningIsFun,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: AppLocalizations.of(context)!.learningIsFunRich,
                      style: TextStyle(
                        fontFamily: Fonts.din,
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.largeFont,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Action when the text is tapped
                        },
                    ),
                    TextSpan(
                        text: AppLocalizations.of(context)!
                            .learningIsFunAfterRichText,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ));

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
                  AnimationWidget(asset: Animations.landing),
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

Widget get _logo => SvgPicture.asset(
      Medias.logoWithName,
      height: Sizes.logoHeight / 5 * 4,
    );

Widget get _description => Builder(
    builder: (context) => SizedBox(
          width: Sizes.btnWidth,
          child: Text(
            AppLocalizations.of(context)!.landingDescription,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ));
