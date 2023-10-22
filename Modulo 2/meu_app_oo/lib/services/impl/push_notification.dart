import 'package:meu_app_oo/class/abstract_person.dart';
import 'package:meu_app_oo/services/notification_interface.dart';

class PushNotification implements NotificationInterface {
  @override
  void sendNotification(Person person) {
    // TODO: implement sendNotification
    print("Enviando Push para: ${person.getName()}");
  }
}
