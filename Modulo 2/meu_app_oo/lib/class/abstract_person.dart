// ignore_for_file: file_names

import 'package:meu_app_oo/enum/type_notification.dart';

abstract class Person {
  String _name = "";
  String _street = "";
  String _email = "";
  String _phone = "";
  String _token = "";
  TypeNotification _typeNotification = TypeNotification.NOTHING;

  void setName(String name) {
    _name = name;
  }

  String getName() {
    return _name;
  }

  void setStreet(String street) {
    _street = street;
  }

  String getStreet() {
    return _street;
  }

  void setNotification(TypeNotification typeNotification) {
    _typeNotification = typeNotification;
  }

  TypeNotification getNotification() {
    return _typeNotification;
  }

  void setEmail(String email) {
    _email = email;
  }

  String getEmail() {
    return _email;
  }

  void setPhone(String phone) {
    _phone = phone;
  }

  String getPhone() {
    return _phone;
  }

  void setToken(String token) {
    _token = token;
  }

  String getToken() {
    return _token;
  }

  Person(String name, String street,
      {TypeNotification typeNotification = TypeNotification.NOTHING}) {
    _name = name;
    _street = street;
    _typeNotification = typeNotification;
  }

  @override
  String toString() {
    return {
      "Name": _name,
      "Street": _street,
      "TypeNotification": _typeNotification
    }.toString();
  }
}
