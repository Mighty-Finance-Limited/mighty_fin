import 'package:flutter/foundation.dart';

class LoanProduct {
  final int id;
  final String name;
  final String description;
  final String icon;
  final String iconAlt;

  LoanProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.iconAlt,
  });

  factory LoanProduct.fromJson(Map<String, dynamic> json) {
    return LoanProduct(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      icon: json['icon'],
      iconAlt: json['icon_alt'],
    );
  }
}

class LoanChildType {
  final int id;
  final String name;
  final String description;
  final List<LoanProduct> loanProducts;

  LoanChildType({
    required this.id,
    required this.name,
    required this.description,
    required this.loanProducts,
  });

  factory LoanChildType.fromJson(Map<String, dynamic> json) {
    var list = json['loan_products'] as List;
    List<LoanProduct> loanProductsList = list.map((i) => LoanProduct.fromJson(i)).toList();

    return LoanChildType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      loanProducts: loanProductsList,
    );
  }
}

class LoanType {
  final int id;
  final String name;
  final String typeName;
  final String icon;
  final String altIcon;
  final List<LoanChildType> loanChildTypes;

  LoanType({
    required this.id,
    required this.name,
    required this.typeName,
    required this.icon,
    required this.altIcon,
    required this.loanChildTypes,
  });

  factory LoanType.fromJson(Map<String, dynamic> json) {
    var list = json['loan_child_type'] as List;
    List<LoanChildType> loanChildTypesList = list.map((i) => LoanChildType.fromJson(i)).toList();

    return LoanType(
      id: json['id'],
      name: json['name'],
      typeName: json['type_name'],
      icon: json['icon'],
      altIcon: json['alt_icon'],
      loanChildTypes: loanChildTypesList,
    );
  }
}
