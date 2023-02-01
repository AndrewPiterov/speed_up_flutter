import 'package:flutter/material.dart';

/// Nothing
class Nothing extends StatelessWidget {
  /// Creates a nothing widget.
  const Nothing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}
