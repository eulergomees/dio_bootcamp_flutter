import 'package:meu_app_oo/class/fisical_person.dart';
import 'package:meu_app_oo/class/legal_person.dart';
import 'package:meu_app_oo/enum/type_notification.dart';
import 'package:meu_app_oo/services/send_notification.dart';

void main(List<String> args) {
  var p2 = FisicalPerson("Euler", "Rua 1", "22222222",
      typeNotification: TypeNotification.EMAIL);
  print(p2);

  var p3 = LegalPerson("Empresa 1", "Rua 3", "3333333333");
  print(p3);

  SendNotification sendNotification = SendNotification();
  sendNotification.notify(p2);
  sendNotification.notify(p3);
}
