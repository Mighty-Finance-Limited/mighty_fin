import 'package:flutter/material.dart';
import 'package:mighty_fin/features/loan/loanWizard/apply/step_five_references.dart';

import '../../../../utils/utils.dart';
import '../../../authentication/widgets/auth_text_heading_widget.dart';
import '../widgets/widgets_export.dart';

class StepFourNextOfKinScreen extends StatefulWidget {
  const StepFourNextOfKinScreen({super.key});

  @override
  State<StepFourNextOfKinScreen> createState() =>
      _StepFourNextOfKinScreenState();
}

class _StepFourNextOfKinScreenState extends State<StepFourNextOfKinScreen> {
  final GlobalKey<FormState> _nextOfKinFormKey = GlobalKey<FormState>();
  final TextEditingController _nokFirstNameController = TextEditingController();
  final TextEditingController _noKLastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _physicalAddressController =
      TextEditingController();
  final TextEditingController _applicantRelationshipController =
      TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nokFirstNameController.dispose();
    _noKLastNameController.dispose();
    _phoneNumberController.dispose();
    _physicalAddressController.dispose();
    _applicantRelationshipController.dispose();
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
            stepCount: 4,
          ),
        ],
      ),
      bottomNavigationBar:  CustomLongBtnWidget(
        btnText: "Next",
        bgColor: secondaryBtnAmber,
        onPressed: () {
          // if (_nextOfKinFormKey.currentState!.validate()) {}
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StepFiveReferencesScreen(),
            ),
          );
        },
      ),
      body: Form(
        key: _nextOfKinFormKey,
        child: ListView(
          children: [
            const ApplyForLoanHeadingTextWidget(
              purpleText: 'Your Next of ',
              amberText: "Kin ",
            ),
            const ApplyForLoanSubHeadingTextWidget(
              subText: 'Next of Kin Details',
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: ProfileInputRowWidget(
                    suffixIcon: const Icon(
                      Icons.account_circle_outlined,
                      color: secondaryBtnPrimary,
                    ),
                    labelText: "First Name (Next of Kin)",
                    controller: _nokFirstNameController,
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
                  flex: 2,
                  child: ProfileInputRowWidget(
                    suffixIcon: const Icon(
                      Icons.account_circle_outlined,
                      color: secondaryBtnPrimary,
                    ),
                    labelText: "Last Name (Next of Kin)",
                    controller: _noKLastNameController,
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
            const SizedBox(
              height: 10,
            ),
            const InputHeadingTextWidget(
              text: "Phone Number(Next of Kin)",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              suffixIcon: const Icon(
                Icons.phone,
                color: secondaryBtnPrimary,
              ),
              filledInput: false,
              horizontalPadding: 15,
              controller: _phoneNumberController,
              hintText: "eg 097926826",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(
              height: 10,
            ),
            const InputHeadingTextWidget(
              text: "Physical Address (Next of Kin)",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: false,
              horizontalPadding: 15,
              controller: _physicalAddressController,
              hintText: "eg Foxdale Plot 32,Lusaka",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 10,
            ),
            const InputHeadingTextWidget(
              text: "Relationship with Applicant",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              maxLines: 4,
              filledInput: false,
              horizontalPadding: 15,
              controller: _applicantRelationshipController,
              hintText: "eg Wife",
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
