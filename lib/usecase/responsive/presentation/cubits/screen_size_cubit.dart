import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ScreenSize {
  mobile,
  web,
  tablet;

  static const int maxMobileWidth = 770;
  static const int maxTabletWidth = 1080;

  static ScreenSize currentSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < maxMobileWidth) return mobile;
    if (width < maxTabletWidth) return tablet;
    return web;
  }
}

class ScreenSizeCubit extends Cubit<ScreenSize> {
  ScreenSizeCubit() : super(ScreenSize.mobile);

  void setSize(ScreenSize newScreenSize) {
    if (state == newScreenSize) return;
    emit(newScreenSize);
  }
}
