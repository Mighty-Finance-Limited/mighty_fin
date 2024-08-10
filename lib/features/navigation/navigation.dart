// import 'package:mighty_fin/features/features.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../utils/constants/colors.dart';
// import '../loan/screens/loan_history.dart';
//
//
// class NavigationScreen extends StatefulWidget {
//   const NavigationScreen({super.key});
//
//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }
//
// class _NavigationScreenState extends State<NavigationScreen> {
//   late PersistentTabController _controller;
//   // late bool _hideNavBar;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     // _hideNavBar = false;
//   }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//   List<Widget> _buildScreens() {
//     return [
//       const DashboardScreen(),
//       const LoanScreen(),
//       LoanHistoryScreen(),
//       const SettingsScreen()
//     ];
//   }
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.home),
//         title: ("Dashboard"),
//         textStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: CupertinoColors.white,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.doc_plaintext),
//         title: ("History"),
//         textStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: CupertinoColors.white,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.account_balance_wallet),
//         title: ("Wallet"),
//         textStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: CupertinoColors.white,
//       ),
//       PersistentBottomNavBarItem(
//         icon: const Icon(CupertinoIcons.person_fill),
//         title: ("Profile"),
//         textStyle: const TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         activeColorPrimary: Colors.white,
//         inactiveColorPrimary: CupertinoColors.white,
//       ),
//     ];
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NavigationBloc, NavigationState>(
//       listener: (context, state) {
//         // Update the tab controller when the bloc state changes
//         if (_controller.index != state.tabIndex) {
//           _controller.jumpToTab(state.tabIndex);
//         }
//       },
//       builder: (context, state) {
//         return PersistentTabView(
//           context,
//           controller: _controller,
//           screens: _buildScreens(),
//           items: _navBarsItems(),
//           onItemSelected: (index) {
//             // Dispatch a navigation event when a tab is selected
//             context.read<NavigationBloc>().add(NavigationChangeEvent(tabIndex: index));
//           },
//           // handleAndroidBackButtonPress: true,
//           resizeToAvoidBottomInset: true,
//           stateManagement: true,
//           hideNavigationBarWhenKeyboardAppears: true,
//           padding: const EdgeInsets.all(10),
//           margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
//           backgroundColor: primary,
//           // backgroundColor: Colors.grey.shade900,
//           isVisible: true,
//           animationSettings: const NavBarAnimationSettings(
//             // Navigation Bar's items animation properties.
//             navBarItemAnimation: ItemAnimationSettings(
//               duration: Duration(milliseconds: 400),
//               curve: Curves.ease,
//             ),
//             screenTransitionAnimation: ScreenTransitionAnimationSettings(
//               // Screen transition animation on change of selected tab.
//               animateTabTransition: true,
//               duration: Duration(milliseconds: 200),
//               screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
//             ),
//           ),
//           confineToSafeArea: true,
//           navBarHeight: kBottomNavigationBarHeight,
//           bottomScreenMargin: 0,
//           navBarStyle: NavBarStyle.style1,
//           decoration: NavBarDecoration(
//             borderRadius: BorderRadius.circular(25.0),
//             // colorBehindNavBar: Colors.red,
//           ),
//         );
//       },
//     );
//   }
// }
//
// class NavigationScreen extends StatelessWidget {
//   const NavigationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<NavigationBloc, NavigationState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           bottomNavigationBar: const AppBottomNavigationBar(),
//           body: <Widget>[
//             const DashboardScreen(),
//             const LoanScreen(),
//             // const TicketsScreen(),
//             LoanHistoryScreen(),
//             const SettingsScreen()
//           ][state.tabIndex],
//         );
//       },
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/features/features.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import '../../utils/constants/colors.dart';
import '../loan/screens/loan_history.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.usePersistentNavBar) {
          return PersistentTabView(
            context,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardAppears: true,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10,right: 10,left: 10),
            backgroundColor: primary,
            isVisible: true,
            animationSettings: const NavBarAnimationSettings(
              // Navigation Bar's items animation properties.
              navBarItemAnimation: ItemAnimationSettings(
                duration: Duration(milliseconds: 400),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimationSettings(
                // Screen transition animation on change of selected tab.
                animateTabTransition: true,
                duration: Duration(milliseconds: 200),
                screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
              ),
            ),
            confineToSafeArea: true,
            navBarHeight: kBottomNavigationBarHeight,
            bottomScreenMargin: 0,
            navBarStyle: NavBarStyle.style1,
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(25.0),
              // colorBehindNavBar: Colors.red,
            ),
            controller: PersistentTabController(initialIndex: state.tabIndex),
            screens: [
              const DashboardScreen(),
              const LoanScreen(),
              LoanHistoryScreen(),
              const SettingsScreen()
            ],
            items: [
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.home),
                title: "Dashboard",
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: CupertinoColors.white,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.doc_plaintext),
                title: "History",
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: CupertinoColors.white,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(Icons.account_balance_wallet),
                title: "Wallet",
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: CupertinoColors.white,
              ),
              PersistentBottomNavBarItem(
                icon: const Icon(CupertinoIcons.person_fill),
                title: "Profile",
                activeColorPrimary: Colors.white,
                inactiveColorPrimary: CupertinoColors.white,
              ),
            ],
            onItemSelected: (index) {
              context.read<NavigationBloc>().add(NavigationChangeEvent(tabIndex: index));
            },
          );
        } else {
          return Scaffold(
            bottomNavigationBar: const AppBottomNavigationBar(),
            body: <Widget>[
              const DashboardScreen(),
              const LoanScreen(),
              LoanHistoryScreen(),
              const SettingsScreen()
            ][state.tabIndex],
          );
        }
      },
    );
  }
}
