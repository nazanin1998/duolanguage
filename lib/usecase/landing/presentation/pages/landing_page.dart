import 'package:duolingo/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../l10n/app_localizations.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/constants/medias.dart';
import '../../../../core/widgets/buttons/happy_button.dart';
import '../../../../core/widgets/buttons/neutral_button.dart';
import '../widgets/landing_first_animation_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _header,
          _body,
        ],
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
                        HappyButton(
                          text: AppLocalizations.of(context)!.getStarted,
                          onTap: () {
                            //todo
                          },
                        ),
                        SizedBox(height: Sizes.mainMargin),
                        NeutralButton(
                          text: AppLocalizations.of(context)!.haveAccount,
                          onTap: () {
                            //todo
                          },
                        )
                      ],
                    ),
                  ],
                ),
                _countrySlider
              ],
            ),
          ));

  Widget get _countrySlider => Container(
        color: Colors.yellow,
        height: Sizes.appbarHeight,
      );

  Widget get _header => SizedBox(
        height: Sizes.appbarHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: Sizes.mainMargin),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [_logo, _language],
            ),
            SizedBox(height: Sizes.mainMargin),
            Divider(
              color: AppColors.neutralGray,
              height: 2,
            )
          ],
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

  Widget get _language => Builder(
        builder: (context) => InkWell(
          child: Row(
            children: [
              Text(
                AppLocalizations.of(context)!.siteLanguage,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppColors.textGray,
              )
            ],
          ),
        ),
      );
}
