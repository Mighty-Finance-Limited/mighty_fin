import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_fin/utils/utils.dart';
import '../notification_exports.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List<NotificationModel> emptyNotifications = [];

  List<NotificationModel> availableNotifications = [
    NotificationModel(
      title: "Congratulations",
      content:
          "Congratulations! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "12:07",
    ),
    NotificationModel(
      title: "We are currently reviewing your loan",
      content:
          "Congratulations! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "15:14",
    ),
    NotificationModel(
      title: "Congratulations",
      content:
          "Congratulations! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "15:19",
    ),
    NotificationModel(
      title: "Loan application submited!",
      content:
          "Congratulations! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "15:36",
    ),
    NotificationModel(
      title: "Repay your loan!",
      content:
          "Congratulations! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "16:04",
    ),
    NotificationModel(
      title: "Repay your loan!",
      content:
          "Congratulations! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "16:13",
    ),
    NotificationModel(
      title: "Repay your loan!",
      content:
          "Congratulation! Your K1,000 Loan has been Successfully approved. See details here!",
      timeStamp: "16:20",
    ),
  ];

  // bool showNotifications = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomCircleBackBtnWidget(
              filledBg: Colors.white,
              filledIconColor: secondaryBtnPrimary,
            ),
            title: Text(
              'Notifications',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: textPrimary,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.dashboard_outlined,
                  size: 25,
                  color: secondaryBtnPrimary,
                ),
              ),
            ],
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  // icon: Icon(Icons.notification_important_outlined),
                  text: "Today",
                ),
                Tab(
                  // icon: Icon(Icons.history_outlined),
                  text: "Older",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              NotificationListBuilderWidget(
                notifications: availableNotifications,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          "assets/svg/no_data.svg",
                        ),
                      ),
                       Expanded(
                        child: Text(
                          "No Older Notifications",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
