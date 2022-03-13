import 'package:flutter/material.dart';

///
class ReadMoreWidget extends StatelessWidget {
  ///
  const ReadMoreWidget(
    this.text, {
    required this.maxLines,
    required this.showMore,
    this.isSelectable = false,
    this.textDirection = TextDirection.ltr,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textStyle,
    this.showLess,
    Key? key,
  }) : super(key: key);

  ///
  final String text;

  ///
  final int maxLines;

  ///
  final TextStyle? textStyle;

  ///
  final Widget showMore;

  ///
  final bool isSelectable;

  ///
  final TextDirection textDirection;

  ///
  final CrossAxisAlignment crossAxisAlignment;

  ///
  final Widget? showLess;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(text: text, style: textStyle);
        final tp = TextPainter(
          text: span,
          maxLines: maxLines,
          textDirection: textDirection,
        );

        tp.layout(maxWidth: size.maxWidth);

        return Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (tp
                .didExceedMaxLines) // The text has more than [maxLines] lines.
              Text(
                text,
                maxLines: maxLines,
                style: textStyle,
              )
            else
              Text(
                text,
                style: textStyle,
              ),
            if (tp.didExceedMaxLines) showMore,
          ],
        );
      },
    );
  }
}
