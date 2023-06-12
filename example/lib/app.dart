import 'package:example/pages/contact_list_page.dart';
import 'package:example/pages/multi_tap_button.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          const ContactListPage(), // DebounceButtonPage(), // ReadMore(),  const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
