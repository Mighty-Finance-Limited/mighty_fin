import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mighty_fin/features/features.dart';
import 'package:mighty_fin/features/settings/widgets/custom_input_date_picker.dart';
import 'package:mighty_fin/features/settings/widgets/upload_image_widget.dart';
import '../../../utils/utils.dart';

enum Gender { male, female }

extension GenderExtension on Gender {
  int get id {
    switch (this) {
      case Gender.male:
        return 1;
      case Gender.female:
        return 2;
      default:
        throw UnimplementedError();
    }
  }

  String get gender {
    switch (this) {
      case Gender.male:
        return "Male";
      case Gender.female:
        return "Female";
      default:
        throw UnimplementedError();
    }
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _editProfileFormKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nrcNumberController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  Gender? selectedGender;
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
  }

  void _pickDateOfBirth() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1940),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _dateOfBirthController.text = _dateFormat.format(pickedDate);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _nrcNumberController.dispose();
    _jobTitleController.dispose();
    _genderController.dispose();
    _dateOfBirthController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldPrimary,
      appBar: AppBar(
        backgroundColor: scaffoldPrimary,
        leading: const CustomCircleBackBtnWidget(
          filledBg: scaffoldPrimary,
          filledIconColor: secondaryBtnPrimary,
        ),
        title: Text(
          "Profile",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: textPrimary,
          ),
        ),
        iconTheme: const IconThemeData(
          size: 30,
          color: secondaryBtnPrimary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_outlined,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        // decoration: const BoxDecoration(color: Colors.amber),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              style:ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  btnRed,
                ),
              ),
              onPressed: () {
                context.read<AuthBloc>().add(LogoutEvent());
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                "Logout",
                style: GoogleFonts.montserrat(
                  color: textWhite,
                  fontWeight: FontWeight.bold,
                  // fontSize: 18,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  secondaryBtnAmber,
                ),
              ),
              onPressed: () {

              },
              child: Text(
                "Save",
                style: GoogleFonts.montserrat(
                  color:textWhite,
                  fontWeight: FontWeight.bold,
                  // fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _editProfileFormKey,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // const UserProfileImageWidget(),
            const UserImagePickerWidget(),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Flexible(
                  child: ProfileInputRowWidget(
                    labelText: "First Name",
                    controller: _firstNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                Flexible(
                  child: ProfileInputRowWidget(
                    labelText: "Last Name",
                    controller: _lastNameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
              ],
            ),
            const InputHeadingTextWidget(
              text: "PHONE Number",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: true,
              horizontalPadding: 15,
              controller: _phoneNumberController,
              hintText: "eg.097000000",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              // prefixIcon: const Icon(Icons.phone),
              obscuredText: false,
              keyboardType: TextInputType.phone,
            ),
            const InputHeadingTextWidget(
              text: "NRC Number",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: true,
              horizontalPadding: 15,
              controller: _phoneNumberController,
              hintText: "12345/3/1",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              // prefixIcon: const Icon(Icons.phone),
              obscuredText: false,
              keyboardType: TextInputType.text,
            ),
            const InputHeadingTextWidget(
              text: "Gender",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputDropDownField<Gender>(
              prefixIcon:  const Icon(
                Icons.person_outline,
                color: primary,
              ),
              hintText: "Select your Gender",
              value: selectedGender,
              items: Gender.values,
              validator: (value) {
                if (value == null) {
                  return 'Please select your Gender';
                }
                return null;
              },
              onChanged: (Gender? gender) {
                setState(() {
                  selectedGender = gender;
                  _genderController.text = gender!.id.toString();
                  print(_genderController.text);
                  // print(purpose?.id);
                });
              },
              getText: (Gender? value) => value?.gender ?? "Select Gender",
            ),
            DateOfBirthInputPickerWidget(
              filledInput: true,
              horizontalPadding: 15,
              hintText: "18-08-1993",
              controller: _dateOfBirthController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              onTap: _pickDateOfBirth,
            ),
            const InputHeadingTextWidget(
              text: "Present Address",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: true,
              horizontalPadding: 15,
              controller: _addressController,
              hintText: "Munali,Lusaka",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.name,
            ),
          ],
        ),
      ),
    );
  }
}
