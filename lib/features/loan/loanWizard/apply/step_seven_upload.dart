import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:mighty_fin/features/features.dart';
import 'package:mighty_fin/utils/constants/svg_icons.dart';
import 'package:mighty_fin/utils/utils.dart';
import '../blocs/upload_bloc.dart';

class StepSevenUploadDocumentsScreen extends StatelessWidget {
  const StepSevenUploadDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            stepCount: 7,
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          return CustomLongBtnWidget(
            bgColor: secondaryBtnAmber,
            btnText: "Next",
            onPressed: () {
              if (_validateUploads(state)) {
                context.read<UploadBloc>().add(UploadFilesEvent());
                _showLoanSummaryBottomSheet(context);
              } else {
                _showValidationErrorDialog(context);
              }
            },
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SvgPicture.asset(
                SvgIconAsset.confirmedSvg,
                height: 80,
                width: 80,
              ),
            ), // replace with your image
            const Center(
              child: Text(
                'Upload',
                style: TextStyle(
                  color: textPrimary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Chip(
                label: Text(
                  'Upload your documents below',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: textPrimary,
                  ),
                ),
                backgroundColor: primaryBtnLightPrimary,
                side: BorderSide.none,
                labelPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            BlocBuilder<UploadBloc, UploadState>(
              builder: (context, state) {
                return Column(
                  children: [
                    _buildUploadButton(context, 'NRC', state.nrc, () {
                      context.read<UploadBloc>().add(SelectFileEvent('nrc'));
                    }),
                    _buildUploadButton(context, 'Latest Payslip', state.payslip,
                        () {
                      context
                          .read<UploadBloc>()
                          .add(SelectFileEvent('payslip'));
                    }),
                    _buildUploadButton(
                        context, '3 months Bank statement', state.bankStatement,
                        () {
                      context
                          .read<UploadBloc>()
                          .add(SelectFileEvent('bankStatement'));
                    }),
                    _buildUploadButton(
                        context, 'Passport size photo', state.passportPhoto,
                        () {
                      context
                          .read<UploadBloc>()
                          .add(SelectFileEvent('passportPhoto'));
                    }),
                    _buildUploadButton(
                        context, 'Pre approval Document', state.preApproval,
                        () {
                      context
                          .read<UploadBloc>()
                          .add(SelectFileEvent('preApproval'));
                    }),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadButton(
      BuildContext context, String label, XFile? file, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        // decoration: BoxDecoration(
        //   color: primaryBtnLightPrimary,
        //   borderRadius: BorderRadius.circular(10),
        // ),
        tileColor: primaryBtnLightPrimary,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: primaryBtnLightPrimary,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: textPrimary,
          ),
        ),
        trailing: IconButton(
          style: const ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            backgroundColor: WidgetStatePropertyAll(secondaryBtnAmber),
          ),
          icon: Icon(
            file == null ? Icons.add : Icons.check,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }

  bool _validateUploads(UploadState state) {
    return state.nrc != null &&
        state.payslip != null &&
        state.bankStatement != null &&
        state.passportPhoto != null &&
        state.preApproval != null;
  }

  void _showValidationErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '                ',
                ),
                WidgetSpan(
                  child: Icon(
                    Icons.warning_amber_rounded,
                    color: secondaryBtnAmber,
                    size: 45,
                  ),
                ),
                TextSpan(
                  text: '\n  Upload Incomplete',
                )
              ],
            ),
            style: TextStyle(
              color: textAmber,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            '  Please upload all the required \n  documents before proceeding.',
            style: TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showLoanSummaryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: bgPrimary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text.rich(
                TextSpan(text: "Loan", children: [
                  TextSpan(
                    text: ' Summary',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textAmber,
                    ),
                  )
                ]),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: textWhite,
                ),
              ),

              /// Temporal Solution
              const Text(
                "-------------------------------------------------------------------------------",
                style: TextStyle(
                  color: textWhite,
                ),
              ),
              const SizedBox(height: 16),

              /// Make his loop through the summary items in future
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Loan Amount",
                summaryTextRight: "K5000",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Loan type",
                summaryTextRight: "GRZ Loan",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Tenure (months)",
                summaryTextRight: "1",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Service Fee",
                summaryTextRight: "10%",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Approved Amount",
                summaryTextRight: "K4500",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Monthly Installment",
                summaryTextRight: "K5500",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Next Payment",
                summaryTextRight: "2024-03-30",
              ),
              const LoanSummaryListTileWidget(
                summaryTextLeft: "Interest Rate",
                summaryTextRight: "18%",
              ),
              // const Text(
              //   'Loan Amount:             K5000\n'
              //   'Loan type: GRZ Loan\n'
              //   'Tenure (months): 1\n'
              //   'Service Fee: 10%\n'
              //   'Approved Amount: K4500\n'
              //   'Monthly Installment: K5500\n'
              //   'Next Payment: 2024-03-30\n'
              //   'Interest Rate: 18%',
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: textPrimary,
              //   ),
              // ),
              const SizedBox(height: 16),
              CustomLongBtnWidget(
                btnText: "Submit",
                bgColor: secondaryBtnAmber,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NavigationScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class LoanSummaryListTileWidget extends StatelessWidget {
  final String summaryTextLeft;
  final String summaryTextRight;

  const LoanSummaryListTileWidget({
    super.key,
    required this.summaryTextLeft,
    required this.summaryTextRight,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 20,
      textColor: textWhite,
      title: Text(
        '$summaryTextLeft:',
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        summaryTextRight,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class UploadLoadingScreen extends StatelessWidget {
  const UploadLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset(LottieAsset.loadingLottieOne),
      ),
    );
  }
}

