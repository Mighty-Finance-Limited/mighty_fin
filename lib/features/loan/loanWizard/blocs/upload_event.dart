part of 'upload_bloc.dart';

@immutable
sealed class UploadEvent {}
class SelectFileEvent extends UploadEvent {
  final String documentType;

  SelectFileEvent(this.documentType);
}

class UploadFilesEvent extends UploadEvent {}