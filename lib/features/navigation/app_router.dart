// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:transit_mate/features/features.dart';
// import 'package:transit_mate/features/more/screens/settings.dart';
//
// class AppRouter {
//   AppRouter();
//
//   late final GoRouter router = GoRouter(
//
//       routes: [
//     GoRoute(
//       name: 'bottomNav',
//       path: '/',
//       builder: (BuildContext context, GoRouterState state) {
//         return const NavigationScreen();
//       },
//     ),
//     // GoRoute(
//     //   name: 'home',
//     //   path: '/home',
//     //   builder: (BuildContext context, GoRouterState state) {
//     //     ValueNotifier<bool> isBottomNavBarVisible = ValueNotifier<bool>(true);
//     //     return HomeScreen(
//     //       isBottomNavBarVisible: isBottomNavBarVisible,
//     //     );
//     //   },
//     // ),
//     GoRoute(
//       name: 'favourites',
//       path: '/favourites',
//       builder: (BuildContext context, GoRouterState state) {
//         return const FavouritesScreen();
//       },
//     ),
//     GoRoute(
//       name: 'tickets',
//       path: '/tickets',
//       builder: (BuildContext context, GoRouterState state) {
//         return const TicketsScreen();
//       },
//     ),
//     GoRoute(
//       name: 'more',
//       path: '/more',
//       builder: (BuildContext context, GoRouterState state) {
//         return const MoreScreen();
//       },
//     ),
//     GoRoute(
//       name: 'settings',
//       path: '/settings',
//       builder: (BuildContext context, GoRouterState state) {
//         return const SettingsScreen();
//       },
//     ),
//   ]);
// }
