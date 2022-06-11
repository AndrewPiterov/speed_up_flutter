import 'package:flutter/material.dart';

/// Number extension
extension NumberExtensions on num {
  /// Add horizontal space
  SizedBox get h => SizedBox(height: double.parse(toString()));

  /// Add horizontal space
  SizedBox get w => SizedBox(width: double.parse(toString()));
}
