import 'package:example/pages/debounce_button_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const DebounceButtonPage(), // ReadMore(),  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
