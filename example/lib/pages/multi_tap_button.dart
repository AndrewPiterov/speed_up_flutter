import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class MultiTapButtonPage extends StatelessWidget {
  const MultiTapButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiTapButton'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MultiTapButton.gestureDetector(
              onTap: () {
                print(' 🚀 DO SOMETHING');
              },
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.blue,
                //   borderRadius: BorderRadius.circular(8),
                // ),
                // padding: const EdgeInsets.all(20),
                child: const Text('Tap me 7 times'),
              ),
            ),
          ),
          20.h,
          Center(
            child: MultiTapButton.inkWell(
              onTap: () {
                print(' 🚀 DO SOMETHING');
              },
              child: Container(
                // decoration: BoxDecoration(
                //   color: Colors.blue,
                //   borderRadius: BorderRadius.circular(8),
                // ),
                // padding: const EdgeInsets.all(20),
                child: const Text('Tap me 7 times'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
