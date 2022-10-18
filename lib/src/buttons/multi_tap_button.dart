import 'dart:developer';

import 'package:flutter/material.dart';

/// A button that can track tap count in period of time to execute the action.
class MultiTapButton extends StatefulWidget {
  /// Creates a new [MultiTapButton].
  const MultiTapButton({
    required this.onTap,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.requiredTaps = 7,
    this.inkWell = false,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget child;
  final int requiredTaps;
  final Duration duration;
  final bool inkWell;

  @override
  State<MultiTapButton> createState() => _MultiTapButtonState();

  factory MultiTapButton.inkWell({
    required VoidCallback onTap,
    required Widget child,
    int requiredTaps = 7,
    Duration duration = const Duration(milliseconds: 500),
    Key? key,
  }) {
    return MultiTapButton(
      onTap: onTap,
      requiredTaps: requiredTaps,
      duration: duration,
      key: key,
      child: child,
    );
  }

  factory MultiTapButton.gestureDetector({
    required VoidCallback onTap,
    required Widget child,
    int requiredTaps = 7,
    Duration duration = const Duration(milliseconds: 500),
    Key? key,
  }) {
    return MultiTapButton(
      onTap: onTap,
      requiredTaps: requiredTaps,
      duration: duration,
      key: key,
      inkWell: true,
      child: child,
    );
  }
}

class _MultiTapButtonState extends State<MultiTapButton> {
  int lastTap = DateTime.now().millisecondsSinceEpoch;
  int consecutiveTaps = 0;

  @override
  Widget build(BuildContext context) {
    return widget.inkWell
        ? InkWell(
            onTap: () {
              _onTap();
            },
            child: widget.child,
          )
        : GestureDetector(
            onTap: () {
              _onTap();
            },
            child: widget.child,
          );
  }

  void _onTap() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final diff = now - lastTap;
    if (diff < widget.duration.inMilliseconds) {
      consecutiveTaps++;
      log(
        'taps = $consecutiveTaps/${widget.requiredTaps}',
        name: 'MultiTapButton',
      );
      if (consecutiveTaps >= widget.requiredTaps) {
        consecutiveTaps = 0;
        widget.onTap();
      }
    } else {
      consecutiveTaps = 1;
    }
    lastTap = now;
  }
}
