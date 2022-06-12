import 'package:example/pages/debounce_button.dart';
import 'package:example/pages/read_more_page.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const DebounceButtonPage(), // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
