import 'package:flutter/material.dart';

export './first_last_item_in_list.dart';
export './read_more_widget.dart';
export './section.dart';

///
extension StringExtension on String {
  ///
  Text asText({
    TextStyle? style,
    int? maxLines,
    TextAlign? textAlign,
  }) {
    return Text(
      this,
      style: style,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

///
extension WidgetExtension on Widget {
  /// Centers its child.
  Center inCenter() {
    return Center(child: this);
  }

  /// Insets the widget
  Padding wrapWith(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  ///
  @Deprecated('use `sidePad` instead')
  Padding sidePadded({
    Axis axis = Axis.horizontal,
    double pad = 20,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: axis == Axis.horizontal ? pad : 0,
        vertical: axis == Axis.vertical ? pad : 0,
      ),
      child: this,
    );
  }

  ///
  Padding sidePad(
    double pad, {
    Axis axis = Axis.horizontal,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: axis == Axis.horizontal ? pad : 0,
        vertical: axis == Axis.vertical ? pad : 0,
      ),
      child: this,
    );
  }
}
