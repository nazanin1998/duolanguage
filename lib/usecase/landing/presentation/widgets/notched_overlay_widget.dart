import 'package:flutter/material.dart';

class NotchedOverlayWidget extends StatelessWidget {
  final Widget child;
  final double untilNotchSpace;
  final double notchHeight;
  final double notchWidth;
  final double curve;
  final double lineWidth;

  final EdgeInsetsGeometry padding;

  final Color filledColor;
  final Color borderColor;

  final bool hasBorder;
  final bool isFilled;

  const NotchedOverlayWidget({
    super.key,
    required this.child,
    this.notchWidth = 14.0,
    this.notchHeight = 8.0,
    this.untilNotchSpace = 100,
    this.curve = 10,
    this.padding = const EdgeInsets.all(10),
    this.lineWidth = 2,
    this.filledColor = Colors.black,
    this.borderColor = Colors.black,
    this.hasBorder = true,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ChatBubblePainter(
        lineWidth: lineWidth,
        notchWidth: notchWidth,
        notchHeight: notchHeight,
        untilNotchSpace: untilNotchSpace,
        curve: curve,
        filledColor: filledColor,
        borderColor: borderColor,
        hasBorder: hasBorder,
        isFilled: isFilled,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minWidth: untilNotchSpace + notchWidth + curve,
            minHeight: curve * 2),
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

class ChatBubblePainter extends CustomPainter {
  final double untilNotchSpace;
  final double notchHeight;
  final double notchWidth;
  final double lineWidth;
  final double curve;
  final Color filledColor;
  final Color borderColor;
  final bool isFilled;
  final bool hasBorder;

  ChatBubblePainter({
    required this.lineWidth,
    required this.notchHeight,
    required this.notchWidth,
    required this.untilNotchSpace,
    required this.curve,
    required this.filledColor,
    required this.borderColor,
    required this.isFilled,
    required this.hasBorder,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final filledPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = filledColor;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..color = borderColor;

    final double width = size.width;
    final double height = size.height;

    final double widthUntilNotch = width - notchWidth - untilNotchSpace;
    final double widthUntilNotchCenter = widthUntilNotch + notchWidth / 2;
    final double widthAfterNotch = widthUntilNotch + notchWidth;

    final path = Path();

    path.moveToTopLeftCorner(curve);

    path.drawCurveOnTopLeftCorner(curve);

    path.drawNotch(
        widthUntilNotch, widthUntilNotchCenter, widthAfterNotch, notchHeight);

    path.lineTo(widthAfterNotch, 0);
    path.lineTo(width - curve, 0);

    path.drawCurveOnTopRightCorner(curve, width);

    path.lineTo(width, height - curve);
    path.drawCurveOnBottomRightCorner(curve, width, height);

    path.lineTo(curve, height);
    path.drawCurveOnBottomLeftCorner(curve, height);

    path.close();
    if (isFilled) canvas.drawPath(path, filledPaint);
    if (hasBorder) canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

extension on Path {
  void moveToTopLeftCorner(double height) {
    moveTo(0, height);
  }

  void drawCurveOnTopLeftCorner(double curve) {
    arcToPoint(Offset(curve, 0), radius: Radius.circular(curve));
  }

  void drawCurveOnBottomLeftCorner(double curve, double height) {
    arcToPoint(Offset(0, height - curve), radius: Radius.circular(curve));
  }

  void drawCurveOnTopRightCorner(double curve, double width) {
    arcToPoint(Offset(width, curve), radius: Radius.circular(curve));
  }

  void drawCurveOnBottomRightCorner(double curve, double width, double height) {
    arcToPoint(Offset(width - curve, height), radius: Radius.circular(curve));
  }

  void drawNotch(double widthUntilNotch, double widthUntilNotchCenter,
      double widthAfterNotch, double notchHeight) {
    lineTo(widthUntilNotch, 0);
    lineTo(widthUntilNotchCenter, -notchHeight);
    lineTo(widthAfterNotch, 0);
  }
}
