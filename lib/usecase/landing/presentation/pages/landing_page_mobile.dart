part of './landing_page.dart';

class _LandingPageMobile extends StatelessWidget {
  _LandingPageMobile({super.key});

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
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            _body,
            _header,
          ],
        ),
      ),
    );
  }

  // Widget get _body => SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           _bodyPageOne,
  //           _bodyPageTwo,
  //         ],
  //       ),
  //     );

  Widget get _bodyPageTwo => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _freeFunTextWidget,
              AnimationWidget(asset: Animations.learning),
            ],
          )
        ],
      );

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

  Widget get _header => Builder(builder: (context) {
        return Container(
          height: Sizes.appbarHeight,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                  bottom: BorderSide(color: AppColors.neutralGray, width: 2))),
          child: Center(child: _logo),
        );
      });

  final OverlayEntry _overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: Sizes.appbarHeight / 5 * 4,
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

  Widget get _logo => SvgPicture.asset(
        Medias.logoWithName,
        height: Sizes.logoHeight / 5 * 4,
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