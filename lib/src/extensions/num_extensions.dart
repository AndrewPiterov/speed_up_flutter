import 'package:flutter/material.dart';

final _arr = <String, SizedBox>{};

/// Number extension
extension NumberExtensions on num {
  /// Add horizontal space
  SizedBox get h {
    final x = _arr['h_$this'];
    if (x != null) {
      return x;
    }
    final y = SizedBox(height: double.parse(toString()));
    _arr['h_$this'] = y;
    return y;
  }

  /// Add horizontal space
  SizedBox get w {
    final x = _arr['w_$this'];
    if (x != null) {
      return x;
    }
    final y = SizedBox(width: double.parse(toString()));
    _arr['w_$this'] = y;
    return y;
  }
}
