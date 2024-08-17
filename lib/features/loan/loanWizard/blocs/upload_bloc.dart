import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

import '../repository/upload_repo.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final UploadRepo uploadRepo;
  final ImagePicker _picker = ImagePicker();

  UploadBloc(this.uploadRepo) : super(UploadState()) {
    on<SelectFileEvent>((event, emit) async {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      switch (event.documentType) {
        case 'nrc':
          emit(state.copyWith(nrc: file));
          break;
        case 'payslip':
          emit(state.copyWith(payslip: file));
          break;
        case 'bankStatement':
          emit(state.copyWith(bankStatement: file));
          break;
        case 'passportPhoto':
          emit(state.copyWith(passportPhoto: file));
          break;
        case 'preApproval':
          emit(state.copyWith(preApproval: file));
          break;
      }
    });

    on<UploadFilesEvent>((event, emit) async {
      await uploadRepo.uploadDocuments(state);
      // Handle success or error state
    });
    // on<UploadFilesEvent>((event, emit) async {
    //   emit(UploadLoading());
    //   try {
    //     await uploadRepo.uploadDocuments(state);
    //     emit(UploadSuccess());
    //   } catch (e) {
    //     emit(UploadFailure(e.toString()));
    //   }
    // });
  }
}
