import 'package:awesome_notifications/awesome_notifications.dart';

void createBasicNotification() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: "basic_channel",
          title: 'notification',
          body: 'simple notification body',
          bigPicture:
              'https://tecnoblog.net/wp-content/uploads/2019/09/emoji.jpg',
          notificationLayout: NotificationLayout.BigPicture,
          payload: {'uuid': 'uuid-test'}));
}
