import 'package:flutter/material.dart';

abstract class UIBaseConstants {
  static const nothing = SizedBox.shrink();
  static const neverScroll = NeverScrollableScrollPhysics();
  static const spacer = Spacer();

  static const spinner = Center(
    child: CircularProgressIndicator(
        // color: AppColors.main,
        ),
  );
}
