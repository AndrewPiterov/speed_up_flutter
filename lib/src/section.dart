import 'package:flutter/material.dart';
import './extensions.dart';

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

    return SafeArea(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: alignment,
          children: items,
        ),
      ),
    );
  }
}
