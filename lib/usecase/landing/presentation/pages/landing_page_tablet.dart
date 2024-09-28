part of './landing_page.dart';

class _LandingPageTablet extends StatelessWidget {
  const _LandingPageTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          _body,
          _header,
        ],
      ),
    );
  }

  Widget get _body => SingleChildScrollView(
        child: Column(
          children: [
            _bodyPageOne,
            _bodyPageTwo,
          ],
        ),
      );

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

  Widget get _bodyPageOne => Builder(
      builder: (context) => SizedBox(
            height: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: Sizes.appbarHeight),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        AnimationWidget(asset: Animations.landing),
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

  Widget get _header => Container(
        height: Sizes.appbarHeight,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
                bottom: BorderSide(
              color: AppColors.neutralGray,
              width: Sizes.btnBorderWidth,
            ))),
        child: Center(child: _logo),
      );
}
