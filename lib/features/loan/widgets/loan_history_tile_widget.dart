import 'package:flutter/material.dart';
import 'package:mighty_fin/utils/constants/colors.dart';

class LoanHistoryTileWidget extends StatelessWidget {
  final LoanHistory loanHistory;

  const LoanHistoryTileWidget({
    super.key,
    required this.loanHistory,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: primary,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: loanHistory.isGRZ ? primary : primaryAmber,
        ),
        child: Icon(
          loanHistory.isGRZ ? Icons.person_outline : Icons.store_outlined,
          color: white,
        ),
      ),
      title: Text(
        loanHistory.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text.rich(
        TextSpan(
          text: loanHistory.date,
          children: const [
            TextSpan(
              text: " See Details",
              style: TextStyle(
                color: textAmber,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      trailing: Text(
        "K${loanHistory.amount.toStringAsFixed(0)}",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}

class LoanHistory {
  final int id;
  final String title;
  final String date;
  final int amount;
  final bool isGRZ;

  LoanHistory({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    required this.isGRZ,
  });

  // Optional: factory constructor to create a LoanHistory instance from a Map
  factory LoanHistory.fromMap(Map<String, dynamic> map) {
    return LoanHistory(
      id: map['id'],
      title: map['title'],
      date: map['date'],
      amount: map['amount'],
      isGRZ: map['isGRZ'],
    );
  }
}
