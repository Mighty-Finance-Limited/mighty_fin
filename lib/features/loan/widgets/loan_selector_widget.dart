// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
//
// import '../models/loan_models.dart';
// import '../repository/loan_repo.dart';
//
// class LoanSelectorWidget extends StatefulWidget {
//   const LoanSelectorWidget({
//     super.key,
//     required this.context,
//     required this.loanType,
//     required this.isSelected,
//     required this.loanProvider,
//   });
//
//   final BuildContext context;
//
//   final LoanType loanType;
//   final bool isSelected;
//   final LoanProvider loanProvider;
//
//   @override
//   State<LoanSelectorWidget> createState() => _LoanSelectorWidgetState();
// }
//
// class _LoanSelectorWidgetState extends State<LoanSelectorWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         widget.loanProvider.selectLoanType(widget.loanType);
//       },
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         height: 135,
//         width: 140,
//         decoration: BoxDecoration(
//           color:
//               widget.isSelected ? const Color(0xFFFFC107) : Colors.transparent,
//           border: Border.all(
//             color: widget.isSelected ? const Color(0xFFFFC107) : Colors.purple,
//           ),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SvgPicture.network(
//               widget.loanType.icon,
//               theme: SvgTheme(
//                 currentColor: widget.isSelected ? Colors.white : Colors.purple,
//               ),
//               height: 24,
//               width: 24,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               widget.loanType.name,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: widget.isSelected ? Colors.white : Colors.purple,
//               ),
//             ),
//             Text(
//               widget.loanType.typeName,
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: widget.isSelected ? Colors.white : Colors.purple,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
