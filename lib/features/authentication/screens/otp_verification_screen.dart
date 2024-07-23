import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';
import '../blocs/auth_bloc.dart';
import '../repository/auth_repository.dart';
import '../widgets/widgets.dart';

class OtpVerificationScreen extends StatefulWidget {
  final int userId;

  const OtpVerificationScreen({super.key, required this.userId});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _otpFormKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: const FixedBgColorWithConerRadiusWidgetHelper(),
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 4),
          child: AuthBottomAppBarLogoContainer(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 4),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthBloc(authRepository: AuthRepository()),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              // Navigate to home or show a success message
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/",
                (route) => false,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    "Successfully Verified",
                    style: TextStyle(
                      color: successColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            } else if (state is AuthFailure) {
              // Show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Form(
                  key: _otpFormKey,
                  child: ListView(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text: "    Verify OTP",
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n Enter the OTP sent to your phone",
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const AuthHeadingTextWidget(text: "OTP"),
                      CustomInputWidget(
                        controller: _otpController,
                        hintText: "Enter OTP",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.security),
                        obscuredText: false,
                        keyboardType: TextInputType.number,
                      ),
                      CustomLongBtnWidget(
                        btnText: "Verify",
                        bgColor: secondaryBtnPrimary,
                        onPressed: () {
                          if (_otpFormKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  VerifyOtpEvent(
                                    otp: int.parse(_otpController.text),
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                if (state is AuthLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
