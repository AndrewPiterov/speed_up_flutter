import 'package:speed_up_flutter/speed_up_flutter.dart';
import 'package:flutter/material.dart';

abstract class UI extends UIBaseConstants {
  static final bulletPoint = Container(
    decoration: const BoxDecoration(
      color: Color(0xff6D6C76),
      shape: BoxShape.circle,
    ),
    height: 5,
    width: 5,
  );

  static const divider = Divider(
    color: Colors.black,
    height: 1,
  );

  static Widget linearProgress(bool isBusy) => SizedBox(
        height: 3,
        child:
            isBusy ? const LinearProgressIndicator() : UIBaseConstants.nothing,
      );

  static const sidePad = EdgeInsets.symmetric(horizontal: 15);

  // Inputs
  static const inputBorderRadius = BorderRadius.all(
    Radius.circular(30),
  );
}
