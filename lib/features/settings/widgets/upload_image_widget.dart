import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants/colors.dart';
import '../../authentication/blocs/auth_bloc.dart';

class UserImagePickerWidget extends StatefulWidget {
  const UserImagePickerWidget({super.key});

  @override
  State<UserImagePickerWidget> createState() => _UserImagePickerWidgetState();
}

class _UserImagePickerWidgetState extends State<UserImagePickerWidget> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });

    // You would also want to upload the selected image to your backend here
    // For example, you could dispatch an event to your AuthBloc to handle the upload
    // context.read<AuthBloc>().add(UpdateProfileImageEvent(image: _image));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // Implement listener if needed
        },
        builder: (context, state) {
          if (state is AuthSuccess) {
            final user = state.user;
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: _image != null
                            ? FileImage(_image!)
                            : (user.profilePhotoUrl != null
                                ? NetworkImage(user.profilePhotoUrl!)
                                : null),
                        child: _image == null &&
                                (user.profilePhotoUrl == null ||
                                    user.profilePhotoUrl!.isEmpty)
                            ? const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.upload, size: 30),
                                  Text('Upload Image',style: TextStyle(
                                    color: textWhite
                                  ),),
                                ],
                              )
                            : null,
                      ),
                    ),
                    Text(
                      "${user.fname ?? "N/A"}  ${user.lname ?? "N/A"}",
                      style: GoogleFonts.montserrat(
                          color: textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(user.email),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: primary,
              ),
            );
          }
        },
      ),
    );
  }
}
