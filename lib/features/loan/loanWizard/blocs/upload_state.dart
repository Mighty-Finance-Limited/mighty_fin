part of 'upload_bloc.dart';
//
// @immutable
// sealed class UploadState {}



class UploadState {
  final XFile? nrc;
  final XFile? payslip;
  final XFile? bankStatement;
  final XFile? passportPhoto;
  final XFile? preApproval;

  UploadState({
    this.nrc,
    this.payslip,
    this.bankStatement,
    this.passportPhoto,
    this.preApproval,
  });

  UploadState copyWith({
    XFile? nrc,
    XFile? payslip,
    XFile? bankStatement,
    XFile? passportPhoto,
    XFile? preApproval,
  }) {
    return UploadState(
      nrc: nrc ?? this.nrc,
      payslip: payslip ?? this.payslip,
      bankStatement: bankStatement ?? this.bankStatement,
      passportPhoto: passportPhoto ?? this.passportPhoto,
      preApproval: preApproval ?? this.preApproval,
    );
  }
}


final class UploadInitial extends UploadState {}
final class UploadLoading extends UploadState {}
final class UploadSuccess extends UploadState {}
class UploadFailure extends UploadState {
  final String error;

  UploadFailure(this.error);
}


