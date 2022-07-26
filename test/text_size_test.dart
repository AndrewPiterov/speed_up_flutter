import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:speed_up_flutter/speed_up_flutter.dart';

void main() {
  const headerTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  const paragraphTextStyle = TextStyle(
    fontSize: 14,
  );

  test('Text Size has max width limit', () {
    const maxWidth = 10.0;
    final textSize = getTextSize(
      'I am really long text',
      paragraphTextStyle,
      maxWidth: maxWidth,
    );

    expect(textSize.width, maxWidth);
  });

  test('Text Size has min width', () {
    const minWidth = 100.0;
    final textSize = getTextSize(
      'I',
      paragraphTextStyle,
      minWidth: minWidth,
    );

    expect(textSize.width, minWidth);
  });

  test('Text Size of Header with 2 line', () {
    const title = 'My name,\nAndrew';
    final textSize = getTextSize(
      title,
      headerTextStyle,
    );

    final textSize2 = getTextSize(
      title,
      headerTextStyle,
      maxLine: 2,
    );

    log('One line header: $textSize');
    log('Two lines header: $textSize2');

    expect(true, textSize.width == textSize2.width);
    expect(true, textSize.height < textSize2.height);
  });
}
