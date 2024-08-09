import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/loan_models.dart';

class LoanProvider with ChangeNotifier {
  List<LoanType> _loanTypes = [];
  LoanType? _selectedLoanType;
  LoanChildType? _selectedLoanChildType;

  List<LoanType> get loanTypes => _loanTypes;
  LoanType? get selectedLoanType => _selectedLoanType;
  LoanChildType? get selectedLoanChildType => _selectedLoanChildType;

  Future<void> fetchLoanTypes() async {
    final url = '${dotenv.env['ENDPOINT2']}/get-loan-products';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _loanTypes = data.map((json) => LoanType.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load loan types');
    }
  }

  void selectLoanType(LoanType loanType) {
    _selectedLoanType = loanType;
    _selectedLoanChildType = null;
    notifyListeners();
  }

  void selectLoanChildType(LoanChildType loanChildType) {
    _selectedLoanChildType = loanChildType;
    notifyListeners();
  }
}
