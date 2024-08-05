import 'package:mighty_fin/features/dashboard/screens/dashboard.dart';
import 'package:mighty_fin/features/loan/screens/loan_history.dart';
import 'package:mighty_fin/features/loan/screens/loan_screen.dart';
import 'package:mighty_fin/features/settings/screens/settings.dart';

import './widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/navigation_bloc.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: const AppBottomNavigationBar(),
          body: <Widget>[
            const DashboardScreen(),
            const LoanScreen(),
            // const TicketsScreen(),
            LoanHistoryScreen(),
            const SettingsScreen()
          ][state.tabIndex],
        );
      },
    );
  }
}
