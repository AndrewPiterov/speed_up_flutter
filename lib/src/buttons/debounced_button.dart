import 'dart:async';

import 'package:flutter/material.dart';

///
class DebouncedButton extends StatefulWidget {
  ///
  const DebouncedButton({
    required this.builder,
    required this.onTap,
    this.debounce = const Duration(milliseconds: 200),
    Key? key,
  }) : super(key: key);

  ///
  final Widget Function(bool isEnabled) builder;

  ///
  final VoidCallback onTap;

  /// Debounce
  final Duration debounce;

  @override
  State<DebouncedButton> createState() => _DebouncedButtonState();
}

class _DebouncedButtonState extends State<DebouncedButton> {
  late ValueNotifier<bool> _isEnabled;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _isEnabled = ValueNotifier<bool>(true);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _isEnabled,
      builder: (context, isEnabled, child) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: isEnabled ? _onButtonPressed : null,
        child: widget.builder(isEnabled),
      ),
    );
  }

  void _onButtonPressed() {
    _isEnabled.value = false;
    widget.onTap();
    _timer = Timer(widget.debounce, () => _isEnabled.value = true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
