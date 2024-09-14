class HoverState {
  final bool isHovered;

  HoverState({
    required this.isHovered,
  });

  factory HoverState.init() => HoverState(
        isHovered: false,
      );

  HoverState copyWithIsHovered(bool isHovered) => HoverState(
        isHovered: isHovered,
      );
}
