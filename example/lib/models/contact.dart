import 'package:speed_up/speed_up.dart';

///
class ContactModel {
  ///
  ContactModel(this.name, this.phone);

  final String name;
  final String phone;

  static final fakeList = 20
      .generate((index) => ContactModel('Name #$index', index.toString() * 10))
      .toList();
}
