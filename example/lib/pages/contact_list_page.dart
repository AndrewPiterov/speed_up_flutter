import 'package:example/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

  static const scrollDirection = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Contatcs'.asText(),
      ),
      body: ListView.separated(
        scrollDirection: scrollDirection,
        itemBuilder: (_, index) => FirstLastItemInList(
          child: ContactListItemView(
            ContactModel.fakeList.elementAt(index),
          ),
          index: index,
          total: ContactModel.fakeList.length,
          scrollDirection: scrollDirection,
        ),
        separatorBuilder: (_, __) => 20.h,
        itemCount: ContactModel.fakeList.length,
      ).sidePadded(),
    );
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
