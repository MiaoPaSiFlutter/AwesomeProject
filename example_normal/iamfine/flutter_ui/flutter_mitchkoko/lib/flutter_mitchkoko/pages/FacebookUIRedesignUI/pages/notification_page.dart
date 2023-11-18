import 'package:flutter/material.dart';
import '../models/models_index.dart';

class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[300]),
                child: IconButton(
                    icon: const Icon(Icons.check_circle),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    tooltip: 'Mark all Notification as read',
                    onPressed: () {
                      print('Mark all Notification as read');
                    }),
              ),
            ],
          ),
        ),
        const Divider(thickness: 1, color: Colors.black26),
        Expanded(
          child: ListView.builder(
            itemCount: notificationData.length,
            itemBuilder: (context, i) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    backgroundImage:
                        Image.asset(notificationData[i].avatar).image,
                  ),
                  title: Text(
                    '${notificationData[i].name} ${notificationData[i].description}',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(notificationData[i].time),
                  trailing: IconButton(
                    iconSize: 28,
                    onPressed: () => {},
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
