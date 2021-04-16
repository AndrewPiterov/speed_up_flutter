import 'package:flutter/material.dart';

/// Collect related widgets to a section
///
///
class Section extends StatelessWidget {
  const Section(
    this.children, {
    this.padding = const EdgeInsets.all(20),
  });

  final List<Widget> children;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        padding: padding,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
