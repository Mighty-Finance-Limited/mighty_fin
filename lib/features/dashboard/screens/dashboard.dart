import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/features/features.dart';
import 'package:mighty_fin/utils/utils.dart';

import '../../authentication/blocs/auth_bloc.dart';

class DashboardScreen extends StatelessWidget implements PreferredSizeWidget {
  const DashboardScreen({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(116);

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = ThemeData();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Dashboard",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogoutEvent());
              Navigator.pushReplacementNamed(context, '/login');
            },
            // onPressed: () {
            //   Navigator.pushNamed(context, "/login");
            // },
            icon: const Icon(
              Icons.dashboard_outlined,
            ),
          ),
        ],
        // toolbarHeight: preferredSize.height,
        flexibleSpace: const LinearGradientColorHelper(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSize.height),
          child: BottomAppBarWalletBalanceWidget(preferredSize: preferredSize),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          ApplyForLoanWidget(preferredSize: preferredSize),
          const CustomHeadingWidget(text: "Quick Actions"),
          const QuickActions(showSideMenu: false),
          ReferAFriendWidget(preferredSize: preferredSize),
        ],
      ),
    );
  }
}

