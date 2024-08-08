import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

import '../blocs/navigation_bloc.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
  });

  // final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        int currentPageIndex = state.tabIndex;
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                30,
              ),
              topRight: Radius.circular(
                30,
              ),
            ),
          ),
          child: NavigationBar(
            elevation: 0,
            onDestinationSelected: (int index) {
              BlocProvider.of<NavigationBloc>(context).add(
                NavigationChangeEvent(
                  tabIndex: index,
                ),
              );
            },
            // indicatorColor: Colors.amber,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(
                  Icons.home_outlined,
                  color: white,
                ),
                label: 'Dashboard',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.list_alt_outlined),
                icon: Badge(
                    child: Icon(
                  Icons.list_alt_outlined,
                  color: white,
                )),
                label: 'Loans',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.list_alt_outlined),
                icon: Badge(
                    child: Icon(
                  Icons.list_alt_outlined,
                  color: white,
                )),
                label: 'Loan History',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.settings),
                icon: Icon(
                  Icons.settings_outlined,
                  color: white,
                ),
                label: 'Settings',
              ),
              // NavigationDestination(
              //   selectedIcon: Icon(Icons.list),
              //   icon: Icon(Icons.list_outlined),
              //   label: 'More',
              // ),
            ],
          ),
        );
      },
    );
  }
}
