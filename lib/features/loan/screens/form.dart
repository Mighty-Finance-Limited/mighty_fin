// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:mfs_form/providers/loan_provider.dart';
// import 'package:provider/provider.dart';
//
// import 'models/loan_models.dart';
//
// class FormScreen extends StatelessWidget {
//   const FormScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final loanProvider = Provider.of<LoanProvider>(context);
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF6A1B9A), // Purple background
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Pick Your Loan',
//                     style: TextStyle(
//                       color: Color(0xFFFFC107), // Yellow text
//                       fontSize: 24.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8.0),
//                   const Text(
//                     'Lets get you started, fill in the form to get instant access.',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 14.0,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(height: 16.0),
//                   if (loanProvider.loanTypes.isEmpty)
//                     ElevatedButton(
//                       onPressed: () {
//                         loanProvider.fetchLoanTypes();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFFFFC107),
//                         // Yellow button
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25.0),
//                         ),
//                       ),
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(
//                           vertical: 16.0,
//                           horizontal: 32.0,
//                         ),
//                         child: Text(
//                           'Load Loan Types',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                       ),
//                     )
//                   else
//                     Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: loanProvider.loanTypes
//                               .map((loanType) =>
//                                   buildLoanSelectionGestureDetector(
//                                     context,
//                                     loanType,
//                                     loanProvider.selectedLoanType == loanType,
//                                     loanProvider,
//                                   ))
//                               .toList(),
//                         ),
//                         if (loanProvider.selectedLoanType != null)
//                           DropdownButton<LoanChildType>(
//                             hint: const Text("Select Loan Child Type"),
//                             value: loanProvider.selectedLoanChildType,
//                             items: loanProvider.selectedLoanType!.loanChildTypes
//                                 .map((childType) => DropdownMenuItem(
//                                       value: childType,
//                                       child: Text(childType.name),
//                                     ))
//                                 .toList(),
//                             onChanged: (LoanChildType? newChildType) {
//                               loanProvider.selectLoanChildType(newChildType!);
//                             },
//                           ),
//                         if (loanProvider.selectedLoanChildType != null)
//                           Column(
//                             children:
//                                 loanProvider.selectedLoanChildType!.loanProducts
//                                     .map((product) => ListTile(
//                                           leading: SvgPicture.network(
//                                             height: 20,
//                                             width: 20,
//                                             product.icon,
//                                             theme: const SvgTheme(
//                                               currentColor: Colors.black,
//                                             ),
//                                           ),
//                                           title: Text(product.name),
//                                           subtitle: Text(product.description),
//                                         ))
//                                     .toList(),
//                           ),
//                       ],
//                     ),
//                   const SizedBox(height: 16.0),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle next button press
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFFFFC107), // Yellow button
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                     ),
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(
//                         vertical: 16.0,
//                         horizontal: 32.0,
//                       ),
//                       child: Text(
//                         'Next',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16.0,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   GestureDetector buildLoanSelectionGestureDetector(
//     BuildContext context,
//     LoanType loanType,
//     bool isSelected,
//     LoanProvider loanProvider,
//   ) {
//     return GestureDetector(
//       onTap: () {
//         loanProvider.selectLoanType(loanType);
//       },
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         height: 135,
//         width: 140,
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFFFFC107) : Colors.transparent,
//           border: Border.all(
//             color: isSelected ? const Color(0xFFFFC107) : Colors.purple,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SvgPicture.network(
//               loanType.icon,
//               theme: SvgTheme(
//                 currentColor: isSelected ? Colors.white : Colors.purple,
//               ),
//               height: 24,
//               width: 24,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               loanType.name,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: isSelected ? Colors.white : Colors.purple,
//               ),
//             ),
//             Text(
//               loanType.typeName,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: isSelected ? Colors.white : Colors.purple,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
