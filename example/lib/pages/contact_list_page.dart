import 'package:example/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  Axis _scrollDirection = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Contacts'.asText(),
        actions: [
          IconButton(onPressed: _toggle, icon: const Icon(Icons.toggle_off))
        ],
      ),
      body: ListView.separated(
        scrollDirection: _scrollDirection,
        itemBuilder: (_, index) => FirstLastItemInList(
          scrollDirection: _scrollDirection,
          index: index,
          total: ContactModel.fakeList.length,
          child: ContactListItemView(
            ContactModel.fakeList.elementAt(index),
          ),
        ),
        separatorBuilder: (_, __) =>
            _scrollDirection == Axis.horizontal ? 20.w : 20.h,
        itemCount: ContactModel.fakeList.length,
      ),
    );
  }

  void _toggle() {
    setState(() {
      _scrollDirection == Axis.vertical
          ? _scrollDirection = Axis.horizontal
          : _scrollDirection = Axis.vertical;
    });
  }
}

class ContactListItemView extends StatelessWidget {
  const ContactListItemView(this.contact, {Key? key}) : super(key: key);

  final ContactModel contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          contact.name.asText(
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          20.w,
          Text(contact.phone),
        ],
      ),
    );
  }
}
