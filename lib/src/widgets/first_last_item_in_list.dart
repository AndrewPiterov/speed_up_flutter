import 'package:flutter/material.dart';

class FirstLastItemInList extends StatelessWidget {
  const FirstLastItemInList({
    required this.child,
    required this.index,
    required this.total,
    this.pad = 20,
    this.scrollDirection = Axis.vertical,
    Key? key,
  }) : super(key: key);

  final int index;
  final int total;

  final Widget child;
  final double pad;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    final isFirst = index == 0;
    final isLast = index == total - 1;
    return Padding(
      padding: EdgeInsets.only(
        left: scrollDirection == Axis.vertical
            ? 0
            : isFirst
                ? pad
                : 0,
        right: scrollDirection == Axis.vertical
            ? 0
            : isLast
                ? pad
                : 0,
        top: scrollDirection == Axis.horizontal
            ? 0
            : isFirst
                ? pad
                : 0,
        bottom: scrollDirection == Axis.horizontal
            ? 0
            : isLast
                ? pad
                : 0,
      ),
      child: child,
    );
  }
}
