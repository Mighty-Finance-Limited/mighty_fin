// import 'dart:async';
//
// import 'package:flutter/material.dart';
//
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ConnectivityCubit extends Cubit<ConnectivityResult> {
//   final Connectivity _connectivity = Connectivity();
//   late StreamSubscription<ConnectivityResult> _subscription;
//
//   ConnectivityCubit() : super(ConnectivityResult.none) {
//     _initConnectivity();
//     _subscription = _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
//       emit(result);
//     });
//   }
//
//   Future<void> _initConnectivity() async {
//     try {
//       final result = await _connectivity.checkConnectivity();
//       emit(result);
//     } catch (e) {
//       emit(ConnectivityResult.none);
//     }
//   }
//
//   @override
//   Future<void> close() {
//     _subscription.cancel();
//     return super.close();
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: BlocConsumer<ConnectivityCubit, ConnectivityResult>(
//         listener: (context, state) {
//           // Ensure the listener is handling a single ConnectivityResult
//           if (state == ConnectivityResult.none) {
//             _showNoInternetDialog(context);
//           }
//         },
//         builder: (context, state) {
//           // Ensure the builder is handling a single ConnectivityResult
//           if (state == ConnectivityResult.none) {
//             return Center(
//               child: Text(
//                 'No Internet Connection',
//                 style: TextStyle(color: Colors.red, fontSize: 18),
//               ),
//             );
//           } else {
//             return Center(
//               child: Text(
//                 'You are online',
//                 style: TextStyle(color: Colors.green, fontSize: 18),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   void _showNoInternetDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('No Internet Connection'),
//           content: Text('Please connect to the internet to continue.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }