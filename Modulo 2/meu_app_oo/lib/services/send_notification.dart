import 'package:meu_app_oo/class/abstract_person.dart';
import 'package:meu_app_oo/enum/type_notification.dart';
import 'package:meu_app_oo/services/impl/email_notification.dart';
import 'package:meu_app_oo/services/impl/push_notification.dart';
import 'package:meu_app_oo/services/impl/sms_notification.dart';
import 'package:meu_app_oo/services/notification_interface.dart';

class SendNotification {
  NotificationInterface? notification;

  void notify(Person person) {
    switch (person.getNotification()) {
      case TypeNotification.EMAIL:
        notification = EmailNotification();
        break;
      case TypeNotification.SMS:
        notification = SmsNotification();
        break;
      case TypeNotification.PUSH_NOTIFICATION:
        notification = PushNotification();
        break;
      default:
        break;
    }

    if (notification != null) {
      notification!.sendNotification(person);
    } else {
      print("Pessoa sem tipo de notificacao!");
    }
  }
}
