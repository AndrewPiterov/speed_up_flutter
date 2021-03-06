import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

/// Collect related widgets to a section
/// A section is a thematic grouping of content, typically with a heading
///
/// Usage:
/// ```dart
/// Section(
///   [
///     Text('Name Andrew'),
///     10.h,
///     Text('Age 18'),
///   ],
///   heading: Text('User info'),
/// )
/// ```
class Section extends StatelessWidget {
  ///
  const Section(
    this.children, {
    this.alignment = CrossAxisAlignment.start,
    this.padding = const EdgeInsets.all(20),
    this.heading,
    this.headingBottomPadding = 20,
  });

  final List<Widget> children;
  final CrossAxisAlignment alignment;
  final EdgeInsets padding;

  final Widget? heading;
  final num headingBottomPadding;

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    if (heading != null) {
      items.add(heading!);
      items.add(headingBottomPadding.h);
    }

    items.addAll(children);

    return Padding(
      padding: padding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: alignment,
        children: items,
      ),
    );
  }

  ///
  factory Section.noPad(
    List<Widget> children, {
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
    Widget? heading,
    num headingBottomPadding = 20,
  }) {
    return Section(
      children,
      padding: EdgeInsets.zero,
      heading: heading,
      headingBottomPadding: headingBottomPadding,
      alignment: alignment,
    );
  }
}
