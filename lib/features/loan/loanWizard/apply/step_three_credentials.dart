import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_fin/features/loan/loanWizard/apply/step_four_next_of_kin.dart';
import 'package:mighty_fin/features/settings/widgets/custom_input_date_picker.dart';
import '../../../../utils/utils.dart';
import '../../../../utils/widgets/custom_input_drop_down_widget.dart';
import '../../../authentication/widgets/auth_text_heading_widget.dart';
import '../../../settings/screens/profile.dart';
import '../widgets/widgets_export.dart';

class StepThreeCredentialsScreen extends StatefulWidget {
  const StepThreeCredentialsScreen({super.key});

  @override
  State<StepThreeCredentialsScreen> createState() =>
      _StepThreeCredentialsScreenState();
}

class _StepThreeCredentialsScreenState
    extends State<StepThreeCredentialsScreen> {
  Gender? selectedGender;
  final GlobalKey<FormState> _credentialsFormKey = GlobalKey<FormState>();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _employeeNumberController =
      TextEditingController();
  final TextEditingController _ministryNameController = TextEditingController();
  final TextEditingController _departmentNameController =
      TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');

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
    _dateOfBirthController.dispose();
    _jobTitleController.dispose();
    _employeeNumberController.dispose();
    _ministryNameController.dispose();
    _genderController.dispose();
    _departmentNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Scaffold(
      // backgroundColor: const Color(0xFF6A1B9A), // Purple background
      appBar: AppBar(
        toolbarHeight: 62,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: CustomCircleBackBtnWidget(
          filledIconColor: secondaryBtnPrimary,
          filledBg: theme.scaffoldBackgroundColor,
        ),
        actions: const [
          AppBarLoanWizardStepCountWidget(
            stepCount: 3,
          ),
        ],
      ),
      body: Form(
        key: _credentialsFormKey,
        child: ListView(
          children: [
            const ApplyForLoanHeadingTextWidget(
              purpleText: 'Your ',
              amberText: "Credentials ",
            ),
            const ApplyForLoanSubHeadingTextWidget(
              subText: 'Fill in the form to get instant access',
            ),
            const SizedBox(
              height: 15,
            ),
            const InputHeadingTextWidget(
              text: "Identification Type",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            const IdentificationInputWidget(),
            const InputHeadingTextWidget(
              text: "DOB",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            DateOfBirthInputPickerWidget(
              filledInput: false,
              horizontalPadding: 15,
              hintText: "18-08-1997",
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
              text: "Job Title",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: false,
              horizontalPadding: 15,
              controller: _jobTitleController,
              hintText: "eg Teacher",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.name,
            ),
            const InputHeadingTextWidget(
              text: "Employee Number",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: false,
              horizontalPadding: 15,
              controller: _employeeNumberController,
              hintText: "eg 2629981",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.number,
            ),
            const InputHeadingTextWidget(
              text: "Ministry",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              suffixIcon: const Icon(
                Icons.apartment,
                color: secondaryBtnPrimary,
              ),
              filledInput: false,
              horizontalPadding: 15,
              controller: _ministryNameController,
              hintText: "eg Ministry of Lands",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.text,
            ),
            const InputHeadingTextWidget(
              text: "Gender",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputDropDownField<Gender>(
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
            const InputHeadingTextWidget(
              text: "Department",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              suffixIcon: const Icon(
                Icons.apartment,
                color: secondaryBtnPrimary,
              ),
              filledInput: false,
              horizontalPadding: 15,
              controller: _departmentNameController,
              hintText: "eg Human Resource",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomLongBtnWidget(
              btnText: "Next",
              bgColor: secondaryBtnAmber,
              onPressed: () {
                // if (_credentialsFormKey.currentState!.validate()) {
                //
                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StepFourNextOfKinScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
