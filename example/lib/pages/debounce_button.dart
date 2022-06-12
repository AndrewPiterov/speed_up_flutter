import 'dart:async';
import 'dart:developer';

import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

///
class DebounceButtonPage extends StatelessWidget {
  ///
  const DebounceButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Debounce Button'.asText(),
      ),
      body: Center(
        child: DebouncedButton(
          onTap: () {
            log('${DateTime.now()} Press like ...');
          },
          debounce: const Duration(seconds: 3),
          child: Assets.icons.heart.svg(), // const Text('Like me'),
        ),
      ),
    );
  }
}
