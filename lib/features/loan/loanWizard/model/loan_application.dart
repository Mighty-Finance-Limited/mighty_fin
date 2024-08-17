class LoanApplication {
  final String dob;
  final String nationalId;
  final String nationalIdType;
  final int phone;
  final int employeeNo;
  final String jobTitle;
  final String ministry;
  final String department;
  final int borrowerId;
  final String gender;
  final String nextOfKinFirstName;
  final String nextOfKinLastName;
  final int nextOfKinPhone;
  final String relationship;
  final String physicalAddress;
  final String hrFirstName;
  final String hrLastName;
  final int hrContactNumber;
  final String supervisorFirstName;
  final String supervisorLastName;
  final String supervisorContactNumber;
  final String bankName;
  final String branchName;
  final String accountNames;
  final int accountNumber;
  final int loanProductId;
  final int duration;
  final int amount;

  LoanApplication({
    required this.dob,
    required this.nationalId,
    required this.nationalIdType,
    required this.phone,
    required this.employeeNo,
    required this.jobTitle,
    required this.ministry,
    required this.department,
    required this.borrowerId,
    required this.gender,
    required this.nextOfKinFirstName,
    required this.nextOfKinLastName,
    required this.nextOfKinPhone,
    required this.relationship,
    required this.physicalAddress,
    required this.hrFirstName,
    required this.hrLastName,
    required this.hrContactNumber,
    required this.supervisorFirstName,
    required this.supervisorLastName,
    required this.supervisorContactNumber,
    required this.bankName,
    required this.branchName,
    required this.accountNames,
    required this.accountNumber,
    required this.loanProductId,
    required this.duration,
    required this.amount,
  });

  // Add the copyWith method
  LoanApplication copyWith({
     String? dob,
     String? nationalId,
     String? nationalIdType,
     int? phone,
     int? employeeNo,
     String? jobTitle,
     String? ministry,
     String? department,
     int? borrowerId,
     String? gender,
     String? nextOfKinFirstName,
     String? nextOfKinLastName,
     int? nextOfKinPhone,
     String? relationship,
     String? physicalAddress,
     String? hrFirstName,
     String? hrLastName,
     int ? hrContactNumber,
     String? supervisorFirstName,
     String? supervisorLastName,
     String? supervisorContactNumber,
     String? bankName,
     String? branchName,
     String? accountNames,
     int? accountNumber,
     int? loanProductId,
     int? duration,
     int? amount,
  }) {
    return LoanApplication(
      dob: dob??  this.dob,
      nationalId: nationalId?? this.nationalId,
      nationalIdType: nationalIdType ?? this.nationalIdType,
      phone: phone ?? this.phone,
      employeeNo: employeeNo ?? this.employeeNo,
      jobTitle: jobTitle ?? this.jobTitle,
      ministry: ministry ?? this.ministry,
      department: department ?? this.department,
      borrowerId: borrowerId ?? this.borrowerId,
      gender: gender ?? this.gender,
      nextOfKinFirstName: nextOfKinFirstName??  this.nextOfKinFirstName,
      nextOfKinLastName: nextOfKinLastName ?? this.nextOfKinLastName,
      nextOfKinPhone:  nextOfKinPhone ?? this.nextOfKinPhone,
      relationship: relationship ?? this.relationship,
      physicalAddress: physicalAddress ?? this.physicalAddress,
      hrFirstName: hrFirstName ?? this.hrFirstName,
      hrLastName: hrLastName ?? this.hrLastName,
      hrContactNumber: hrContactNumber ?? this.hrContactNumber,
      supervisorFirstName: supervisorFirstName ?? this.supervisorFirstName,
      supervisorLastName: supervisorLastName ?? this.supervisorLastName,
      supervisorContactNumber: supervisorContactNumber ?? this.supervisorContactNumber,
      bankName: bankName ?? this.bankName,
      branchName: branchName ?? this.branchName,
      accountNames: accountNames ?? this.accountNames,
      accountNumber: accountNumber ?? this.accountNumber,
      loanProductId: loanProductId ?? this.loanProductId,
      duration: duration ?? this.duration,
      amount:amount ?? this.amount,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dob': dob,
      'national_id': nationalId,
      'national_id_type': nationalIdType,
      'phone': phone,
      'employeeNo': employeeNo,
      'jobTitle': jobTitle,
      'ministry': ministry,
      'department': department,
      'borrower_id': borrowerId,
      'gender': gender,
      'nextOfKinFirstName': nextOfKinFirstName,
      'nextOfKinLastName': nextOfKinLastName,
      'nextOfKinPhone': nextOfKinPhone,
      'relationship': relationship,
      'physicalAddress': physicalAddress,
      'hrFirstName': hrFirstName,
      'hrLastName': hrLastName,
      'hrContactNumber': hrContactNumber,
      'supervisorFirstName': supervisorFirstName,
      'supervisorLastName': supervisorLastName,
      'supervisorContactNumber': supervisorContactNumber,
      'bankName': bankName,
      'branchName': branchName,
      'accountNames': accountNames,
      'accountNumber': accountNumber,
      'loan_product_id': loanProductId,
      'duration': duration,
      'amount': amount,
    };
  }
}
