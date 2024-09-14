import 'package:flutter_bloc/flutter_bloc.dart';

import 'hover_state.dart';

class HoverCubit extends Cubit<HoverState> {
  HoverCubit() : super(HoverState.init());

  void setHoverState(bool isHovered) {
    if (state.isHovered == isHovered) return;
    emit(state.copyWithIsHovered(isHovered));
  }
}
