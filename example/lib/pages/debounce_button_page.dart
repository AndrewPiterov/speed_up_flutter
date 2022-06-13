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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LikeToggleButton(
              onTap: (like, count) async {
                log('${DateTime.now()} start ${like ? '❤️' : '👎'}...');
                await Future.delayed(const Duration(seconds: 3));
                log('${DateTime.now()} end ${like ? '❤️' : '👎'}...');
              },
              onChange: (state) {
                log('$state');
              },
              initialState: true,
              initialCount: 1,
              counterPosition: LikeCounterPosition.right,
              likeBuilder: (isLiked, _) => Assets.icons.heart
                  .svg(color: isLiked ? Colors.pink : Colors.grey),
              counterBuilder: (count, isLiked) => Padding(
                padding: const EdgeInsets.all(8),
                child: Text(count.toString()),
              ),
            ),
          ),
          50.h,
          Center(
            child: DebouncedButton(
              onTap: () {
                log('${DateTime.now()} Press like ...');
              },
              debounce: const Duration(seconds: 3),
              builder: (isEnabled) => Text(
                'Like me',
                style: TextStyle(color: isEnabled ? Colors.black : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
