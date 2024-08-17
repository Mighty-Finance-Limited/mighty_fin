import 'package:flutter/material.dart';
import 'package:mighty_fin/features/loan/loanWizard/apply/step_seven_upload.dart';
import '../model/bank_enum.dart';

import '../../../../utils/utils.dart';
import '../../../../utils/widgets/custom_input_drop_down_widget.dart';
import '../../../authentication/widgets/auth_text_heading_widget.dart';
import '../widgets/widgets_export.dart';

class StepSixBankingDetailsScreen extends StatefulWidget {
  const StepSixBankingDetailsScreen({super.key});

  @override
  State<StepSixBankingDetailsScreen> createState() =>
      _StepSixBankingDetailsScreenState();
}

class _StepSixBankingDetailsScreenState
    extends State<StepSixBankingDetailsScreen> {
  BankName? selectedBankName;
  final GlobalKey<FormState> _bankingDetailsFormKey = GlobalKey<FormState>();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankAccountNumberController =
      TextEditingController();
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _accountNameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _bankNameController.dispose();
    _bankAccountNumberController.dispose();
    _branchNameController.dispose();
    _accountNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 62,
        backgroundColor: theme.scaffoldBackgroundColor,
        leading: CustomCircleBackBtnWidget(
          filledIconColor: secondaryBtnPrimary,
          filledBg: theme.scaffoldBackgroundColor,
        ),
        actions: const [
          AppBarLoanWizardStepCountWidget(
            stepCount: 6,
          ),
        ],
      ),
      bottomNavigationBar: CustomLongBtnWidget(
        btnText: "Next",
        bgColor: secondaryBtnAmber,
        onPressed: () {
          // if (_bankingDetailsFormKey.currentState!.validate()) {}
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const StepSevenUploadDocumentsScreen(),
            ),
          );
        },
      ),
      body: Form(
        key: _bankingDetailsFormKey,
        child: ListView(
          children: [
            const ApplyForLoanHeadingTextWidget(
              purpleText: 'Your ',
              amberText: "Banking Details ",
            ),
            const ApplyForLoanSubHeadingTextWidget(
              subText: 'Fill in the form to get instant access',
            ),
            const SizedBox(
              height: 15,
            ),

            const InputHeadingTextWidget(
              text: "Your Bank",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputDropDownField<BankName>(
              hintText: "Select your Bank",
              value: selectedBankName,
              items: BankName.values,
              validator: (value) {
                if (value == null) {
                  return 'Please select your Bank';
                }
                return null;
              },
              onChanged: (BankName? bankName) {
                setState(() {
                  selectedBankName = bankName;
                  _bankNameController.text = bankName!.id.toString();
                  print(_bankNameController.text);
                  // print(purpose?.id);
                });
              },
              getText: (BankName? value) => value?.bank ?? "Select your Bank",
            ),

            const SizedBox(
              height: 10,
            ),
            const InputHeadingTextWidget(
              text: "Bank Account Number",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: false,
              horizontalPadding: 15,
              controller: _bankAccountNumberController,
              hintText: "eg 1234567890",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Bank Acc Number is required";
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
              text: "Branch Name",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: false,
              horizontalPadding: 15,
              controller: _branchNameController,
              hintText: "eg Lusaka",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Branch Name is required";
                }
                return null;
              },
              obscuredText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: 10,
            ),
            const InputHeadingTextWidget(
              text: "Account Name",
              textColor: textPrimary,
              horizontalPadding: 15,
            ),
            CustomInputWidget(
              filledInput: false,
              horizontalPadding: 15,
              controller: _accountNameController,
              hintText: "eg George Munganga",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Account Name is required";
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
