// ignore_for_file: public_member_api_docs

import 'package:example/pages/contact_list_page.dart';
import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ContactListPage(),
              ),
            ),
            icon: const Icon(Icons.people),
          )
        ],
      ),
      body: Container(
        child: Section(
          [
            'Name Andrew'.asText(),
            100.h,
            'Age 18'.asText().inCenter(),
          ],
          heading: 'User info'.asText(),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
