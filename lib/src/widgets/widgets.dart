import 'package:flutter/material.dart';

export './first_last_item_in_list.dart';
export './section.dart';

extension StringExtension on String {
  Text asText({TextStyle? style}) {
    return Text(
      this,
      style: style,
    );
  }
}

extension WidgetExtension on Widget {
  Center inCenter() {
    return Center(child: this);
  }

  Padding sidePadded({Axis axis = Axis.horizontal, double pad = 20}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: axis == Axis.horizontal ? pad : 0,
        vertical: axis == Axis.vertical ? pad : 0,
      ),
      child: this,
    );
  }
}
