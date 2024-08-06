import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../notification_exports.dart';

class NotificationListBuilderWidget extends StatelessWidget {
  const NotificationListBuilderWidget({
    super.key,
    required this.notifications,
  });

  final List<NotificationModel> notifications;

  @override
  Widget build(BuildContext context) {
    if (notifications.isEmpty) {
      return Container(
        height: 200,
        decoration: const BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
            image: AssetImage("assets/people/woman.png"),
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          var notification = notifications[index];
          return NotificationCardWidget(
            notification: notification,
          );
        },
      );
    }
  }
}
