import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/loan_application.dart';


class LoanApplicationCubit extends Cubit<LoanApplication> {
  LoanApplicationCubit() : super(LoanApplication(
    dob: '',
    nationalId: '',
    nationalIdType: '',
    phone: 0,
    employeeNo: 0,
    jobTitle: '',
    ministry: '',
    department: '',
    borrowerId: 1,
    gender: '',
    nextOfKinFirstName: '',
    nextOfKinLastName: '',
    nextOfKinPhone: 0,
    relationship: '',
    physicalAddress: '',
    hrFirstName: '',
    hrLastName: '',
    hrContactNumber: 0,
    supervisorFirstName: '',
    supervisorLastName: '',
    supervisorContactNumber: '',
    bankName: '',
    branchName: '',
    accountNames: '',
    accountNumber: 0,
    loanProductId: 1,
    duration: 1,
    amount: 1000,
  ));
  void updateLoanApplication(LoanApplication updatedApplication) {
    emit(updatedApplication);
  }
}