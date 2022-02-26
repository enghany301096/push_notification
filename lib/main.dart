import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/home_page_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize("resource://drawable/res_app_icon", [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'basic notification',
      channelDescription: 'channelDescription',
      defaultColor: Colors.amberAccent,
      importance: NotificationImportance.High,
      channelShowBadge: true,
    )
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
