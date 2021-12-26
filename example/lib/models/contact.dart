import 'package:speed_up/speed_up.dart';

class ContactModel {
  final String name;
  final String phone;

  ContactModel(this.name, this.phone);

  static final fakeList = 20
      .generate((index) => ContactModel('Name #$index', index.toString() * 10))
      .toList();
}
