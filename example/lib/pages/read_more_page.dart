// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

const _text = """What is Lorem Ipsum?\nLorem Ipsum is simply dummy 
    text of the printing and typesetting industry.
    Lorem Ipsum has been the industry standard dummy text ever since the 1500s,
    when an unknown printer took a galley
    of type and scrambled it to make a type specimen book. 
    It has survived not only five centuries, but also the leap
    into electronic typesetting, remaining essentially unchanged.
    It was popularised in the 1960s with the release of 
    Letraset sheets containing Lorem Ipsum passages, 
    and more recently with desktop publishing software like Aldus 
    PageMaker including versions of Lorem Ipsum""";

class ReadMorePage extends StatefulWidget {
  const ReadMorePage({Key? key}) : super(key: key);

  @override
  State<ReadMorePage> createState() => _ReadMorePageState();
}

class _ReadMorePageState extends State<ReadMorePage> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read More Widget'),
      ),
      body: ReadMoreWidget(
        _text,
        maxLines: _isExpanded ? 1000 : 4,
        // showLess: ,
        showMore: TextButton(
          onPressed: () {
            //
            setState(() {
              _isExpanded = true;
            });
          },
          child: const Text('Read more'),
        ),
      ),
    );
  }
}
