
import 'package:flutter/material.dart';
import 'package:mighty_fin/features/loan/loanWizard/apply/step_six_banking_details.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/widgets/custom_circle_back_btn_widget.dart';
import '../../../../utils/widgets/custom_input_row_widget.dart';
import '../../../../utils/widgets/custom_input_widget.dart';
import '../../../../utils/widgets/custom_long_btn_widget.dart';
import '../../../authentication/widgets/auth_text_heading_widget.dart';
import '../widgets/app_bar_loan_wizard_step_count.dart';
import '../widgets/apply_for_loan_heading_text_widget.dart';
import '../widgets/apply_for_loan_sub_heading_text_widget.dart';

class StepFiveReferencesScreen extends StatefulWidget {
  const StepFiveReferencesScreen({super.key});

  @override
  State<StepFiveReferencesScreen> createState() => _StepFiveReferencesScreenState();
}

class _StepFiveReferencesScreenState extends State<StepFiveReferencesScreen> {
  final GlobalKey<FormState> _referencesFormKey = GlobalKey<FormState>();
  final TextEditingController _hrFirstNameController = TextEditingController();
  final TextEditingController _hrLastNameController = TextEditingController();
  final TextEditingController _hrPhoneNumberController = TextEditingController();
  final TextEditingController _svFirstNameController = TextEditingController();
  final TextEditingController _svLastNameController = TextEditingController();
  final TextEditingController _svPhoneNumberController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _hrFirstNameController.dispose();
    _hrLastNameController.dispose();
    _hrPhoneNumberController.dispose();
    _svFirstNameController.dispose();
    _svLastNameController.dispose();
    _svPhoneNumberController.dispose();
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
            stepCount: 5,
          ),
        ],
      ),
      bottomNavigationBar:  CustomLongBtnWidget(
        btnText: "Next",
        bgColor: secondaryBtnAmber,
        onPressed: () {
          // if (_referencesFormKey.currentState!.validate()) {}
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StepSixBankingDetailsScreen(),
            ),
          );
        },
      ),
      body: Form(
        key: _referencesFormKey,
        child: ListView(
          children: [
            const ApplyForLoanHeadingTextWidget(
              purpleText: 'Your ',
              amberText: "References ",
            ),
            const ApplyForLoanSubHeadingTextWidget(
              subText: 'Human Resource Details',
            ),
            const SizedBox(
              height: 15,
            ),
            // Human Resource Section
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
                    labelText: "First Name (HR)",
                    controller: _hrFirstNameController,
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
                    labelText: "Last Name (HR)",
                    controller: _hrLastNameController,
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
              text: "Phone Number (HR)",
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
              controller: _hrPhoneNumberController,
              hintText: "eg +26097926826",
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
              height: 20,
            ),
            // Supervisor Section
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
                    labelText: "First Name (Supervisor)",
                    controller: _svFirstNameController,
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
                    labelText: "Last Name (Supervisor)",
                    controller: _svLastNameController,
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
              text: "Phone Number (Supervisor)",
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
              controller: _svPhoneNumberController,
              hintText: "eg +26097926826",
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}
