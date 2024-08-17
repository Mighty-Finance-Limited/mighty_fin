import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import '../blocs/upload_bloc.dart';


class UploadRepo {
  final String uploadUrl = 'https://your-api.com/upload';

  Future<void> uploadDocuments(UploadState state) async {
    final request = http.MultipartRequest('POST', Uri.parse(uploadUrl));

    if (state.nrc != null) {
      request.files.add(await _fileToMultipart(state.nrc!, 'nrc'));
    }
    if (state.payslip != null) {
      request.files.add(await _fileToMultipart(state.payslip!, 'payslip'));
    }
    if (state.bankStatement != null) {
      request.files.add(await _fileToMultipart(state.bankStatement!, 'bankStatement'));
    }
    if (state.passportPhoto != null) {
      request.files.add(await _fileToMultipart(state.passportPhoto!, 'passportPhoto'));
    }
    if (state.preApproval != null) {
      request.files.add(await _fileToMultipart(state.preApproval!, 'preApproval'));
    }

    final response = await request.send();

    if (response.statusCode == 200) {
      print('Upload successful');
    } else {
      throw Exception('Failed to upload documents');
    }
  }

  Future<http.MultipartFile> _fileToMultipart(XFile file, String fieldName) async {
    final mimeTypeData = lookupMimeType(file.path, headerBytes: [0xFF, 0xD8])?.split('/');
    return http.MultipartFile.fromPath(
      fieldName,
      file.path,
      contentType: MediaType(mimeTypeData![0], mimeTypeData[1]),
    );
  }
}
