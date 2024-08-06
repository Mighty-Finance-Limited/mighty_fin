import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../model/notification_model.dart';


class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 3,
        color: Colors.white,
        child: ListTile(
          title: Text(
            notification.title,
            style: const TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text.rich(
            TextSpan(
              style: TextStyle(color: Colors.grey.shade700),
              text: notification.content,
              children: [
                TextSpan(
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                  text: "\n${notification.timeStamp}",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}