import 'package:meu_app_oo/class/abstract_person.dart';
import 'package:meu_app_oo/enum/type_notification.dart';

class FisicalPerson extends Person {
  String _cpf = "";

  FisicalPerson(String name, String street, String cpf,
      {TypeNotification typeNotification = TypeNotification.NOTHING})
      : super(name, street, typeNotification: typeNotification) {
    _cpf = cpf;
  }

  void setCPF(String cpf) {
    _cpf = cpf;
  }

  String getCpf() {
    return _cpf;
  }

  @override
  String toString() {
    return {
      "Name": getName(),
      "Street": getStreet(),
      "Cpf": _cpf,
      "TypeNotification": getNotification()
    }.toString();
  }
}
