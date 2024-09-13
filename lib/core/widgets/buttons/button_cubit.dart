import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonCubit extends Cubit<bool> {
  ButtonCubit() : super(false); // Initial color

  void hover(bool isHovered) {
    emit(isHovered);
  }
}