import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/notification_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Alert Notification"),
                  content: const Text("Allow app to Recive notification"),
                  actions: [
                    TextButton(
                        onPressed: () => AwesomeNotifications()
                            .requestPermissionToSendNotifications()
                            .then((_) => Navigator.pop(context)),
                        child: const Text("Allow")),
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Don'\t Allow"))
                  ],
                ));
      }
    });
    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Notification created on ${notification.channelKey}'),
          backgroundColor: Colors.green,
        ),
      );
    });

    AwesomeNotifications().actionStream.listen((event) {
      if (event.channelKey == "Basic_channel") {
        AwesomeNotifications().getGlobalBadgeCounter().then((value) {
          AwesomeNotifications().setGlobalBadgeCounter(value - 1);
        });
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => Scaffold(
                    body: Text("${event.body}"),
                  )),
          (route) => route.isFirst);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example Awesome Notification App'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text('create basic notifications'),
            onPressed: () {
              createBasicNotification();
              //pusher!.unsubscribe('private-orders');
            },
          ),
        ],
      )),
    );
  }
}
