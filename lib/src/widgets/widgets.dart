import 'package:flutter/material.dart';

extension StringExtension on String {
  Text asText({TextStyle? withStyle}) {
    return Text(
      this,
      style: withStyle,
    );
  }
}

extension WidgetExtension on Widget {
  Center inCenter() {
    return Center(child: this);
  }
}
