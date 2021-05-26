import 'package:flutter/widgets.dart';

Size getTextSize(
  String text,
  TextStyle style, {
  int maxLine = 1,
  double minWidth = 0,
  double maxWidth = double.infinity,
  TextDirection textDirection = TextDirection.ltr,
}) {
  final textPainter = TextPainter(
    text: TextSpan(text: text, style: style),
    maxLines: maxLine,
    textDirection: textDirection,
  )..layout(
      minWidth: minWidth,
      maxWidth: maxWidth,
    );
  return textPainter.size;
}
