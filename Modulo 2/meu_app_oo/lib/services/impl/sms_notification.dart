import 'package:meu_app_oo/class/abstract_person.dart';
import 'package:meu_app_oo/services/notification_interface.dart';

class SmsNotification implements NotificationInterface {
  @override
  void sendNotification(Person person) {
    // TODO: implement sendNotification
    print("Enviando SMS para: ${person.getName()}");
  }
}
