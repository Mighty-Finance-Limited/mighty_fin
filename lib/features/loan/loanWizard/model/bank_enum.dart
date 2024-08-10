enum BankName {
  standardChartered,
  zanaco,
  absa,
  firstNationalBank,
  stanBicBank,
  firstCapitalBank,
  ubaBank
}

extension BankExtension on BankName {
  int get id {
    switch (this) {
      case BankName.standardChartered:
        return 1;
      case BankName.zanaco:
        return 2;
      case BankName.absa:
        return 3;
      case BankName.firstNationalBank:
        return 4;
      case BankName.stanBicBank:
        return 5;
      case BankName.firstCapitalBank:
        return 6;
      case BankName.ubaBank:
        return 7;

      default:
        throw UnimplementedError();
    }
  }

  String get bank {
    switch (this) {
      case BankName.standardChartered:
        return "Standard Chartered";
      case BankName.zanaco:
        return "Zanaco";
      case BankName.absa:
        return "Absa";
      case BankName.firstNationalBank:
        return "First National Bank (FNB)";
      case BankName.stanBicBank:
        return "Stanbic Bank";
      case BankName.firstCapitalBank:
        return "First Capital Bank";
      case BankName.ubaBank:
        return "UBA Bank";
      default:
        throw UnimplementedError();
    }
  }
}
