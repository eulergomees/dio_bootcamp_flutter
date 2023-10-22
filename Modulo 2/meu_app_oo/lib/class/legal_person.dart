import 'package:meu_app_oo/class/abstract_person.dart';
import 'package:meu_app_oo/enum/type_notification.dart';

class LegalPerson extends Person {
  String _cnpj = "";

  LegalPerson(String name, String street, String cnpj,
      {TypeNotification typeNotification = TypeNotification.NOTHING})
      : super(name, street, typeNotification: typeNotification) {
    _cnpj = cnpj;
  }

  void setCnpj(String cpf) {
    _cnpj = cpf;
  }

  String getCnpj() {
    return _cnpj;
  }

  @override
  String toString() {
    return {
      "Name": getName(),
      "Street": getStreet(),
      "Cnpj": _cnpj,
      "TypeNotification": getNotification()
    }.toString();
  }
}
