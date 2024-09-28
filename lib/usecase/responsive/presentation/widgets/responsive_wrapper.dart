import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/screen_size_cubit.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget? mobileWidget;
  final Widget? webWidget;
  final Widget? tabletWidget;

  const ResponsiveWrapper({
    super.key,
    this.mobileWidget,
    this.webWidget,
    this.tabletWidget,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenSizeCubit, ScreenSize>(builder: (context, state) {
      ScreenSize size = ScreenSize.currentSize(context);
      switch (size) {
        case ScreenSize.mobile:
          return mobileWidget ?? tabletWidget ?? webWidget ?? const SizedBox();
        case ScreenSize.tablet:
          return tabletWidget ?? mobileWidget ?? webWidget ?? const SizedBox();
        case ScreenSize.web:
          return webWidget ?? tabletWidget ?? mobileWidget ?? const SizedBox();
      }
    });
  }
}
