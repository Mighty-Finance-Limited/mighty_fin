import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mighty_fin/features/authentication/authentication.dart';
import '../../../utils/utils.dart';
import '../blocs/auth_bloc.dart';
import '../widgets/dont_have_account_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _passwordVisible = false;
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _fnameController.dispose();
    _lnameController.dispose();
    _phoneController.dispose();
  }
  // email: bomaho3648@vasomly.com
  // password Mathew10

  // Joseph
  // email2: peref78579@modotso.com
  // password Joseph10

  // email2: sokawa5087@ikangou.com
  // password Joseph10
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
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => OtpVerificationScreen(userId: state.user.id),
              //   ),
              // );
              Navigator.pushReplacementNamed(context, '/').then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Registered Successfully",
                      style: TextStyle(
                        color: successColor,
                        fontWeight: FontWeight.bold,
                      ),
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
                  key: _registerFormKey,
                  child: ListView(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 18),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              text: "    Register",
                              style: TextStyle(
                                color: primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              children: [
                                TextSpan(
                                  text: "\n Sign up to ",
                                  children: [
                                    TextSpan(
                                      text: "get started!",
                                      style: TextStyle(
                                        color: textAmber,
                                      ),
                                    )
                                  ],
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const AuthHeadingTextWidget(text: "First Name"),
                      CustomInputWidget(
                        controller: _fnameController,
                        hintText: "First Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.person_outline),
                        obscuredText: false,
                        keyboardType: TextInputType.name,
                      ),
                      const AuthHeadingTextWidget(text: "Last Name"),
                      CustomInputWidget(
                        controller: _lnameController,
                        hintText: "Last Name",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.person_outline),
                        obscuredText: false,
                        keyboardType: TextInputType.name,
                      ),
                      const AuthHeadingTextWidget(text: "Phone"),
                      CustomInputWidget(
                        controller: _phoneController,
                        hintText: "Phone",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.phone),
                        obscuredText: false,
                        keyboardType: TextInputType.phone,
                      ),
                      const AuthHeadingTextWidget(text: "Email"),
                      CustomInputWidget(
                        controller: _emailController,
                        hintText: "hello@example.com",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color(0xffa8a8a8),
                        ),
                        obscuredText: false,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field is required";
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please enter a valid email address";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      const AuthHeadingTextWidget(text: "Password"),
                      CustomInputWidget(
                        keyboardType: TextInputType.text,
                        obscuredText: !_passwordVisible,
                        controller: _passwordController,
                        hintText: "Password",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.length < 8) {
                            return "Password must have at least 8 characters";
                          }
                          return null;
                        },
                        prefixIcon: const Icon(Icons.lock_outlined),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: primary,
                          ),
                          onPressed: () {
                            setState(() {
                              _passwordVisible = !_passwordVisible;
                            });
                          },
                        ),
                      ),
                      CustomLongBtnWidget(
                        btnText: "Register",
                        bgColor: secondaryBtnPrimary,
                        onPressed: () {
                          if (_registerFormKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(RegisterEvent(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  fname: _fnameController.text,
                                  lname: _lnameController.text,
                                  phone: _phoneController.text,
                                ));
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      DontHaveAccountWidget(
                        text: "Already have an account?",
                        btnText: "Login",
                        onPressed: () {
                          // Navigate to registration screen
                          Navigator.pushNamed(context, "/login");
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
