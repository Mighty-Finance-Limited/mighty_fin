import 'package:flutter/material.dart';
import 'package:mighty_fin/features/authentication/widgets/dont_have_account_widget.dart';
import 'package:mighty_fin/utils/utils.dart';
import '../authentication.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool? _passwordVisible = false;
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 4;
    Size preferredSize = Size.fromHeight(height);
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // toolbarHeight: preferredSize.height,
        flexibleSpace: const FixedBgColorWithConerRadiusWidgetHelper(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(preferredSize.height),
          child: AuthBottomAppBarLogoContainer(preferredSize: preferredSize),
        ),
      ),
      body: Form(
        key: _loginFormKey,
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
              child: Center(
                child: Text.rich(
                  TextSpan(
                      text: "    Log in",
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      children: [
                        TextSpan(
                            text: "\n Sign in to ",
                            children: [
                              TextSpan(
                                  text: "continue!",
                                  style: TextStyle(
                                    color: textAmber,
                                  ))
                            ],
                            style: TextStyle(
                              fontSize: 14,
                            ))
                      ]),
                ),
              ),
            ),
            const AuthHeadingTextWiidget(text: "Email"),
            CustomInputWidget(
              controller: _emailController,
              hintText: "hello@example.com",
              prefixIcon: const Icon(
                Icons.email,
                color: Color(0xffa8a8a8),
              ),
              // suffixIcon: Icons.email,
              obscuredText: false,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required";
                }
                // using regular expression
                if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const AuthHeadingTextWiidget(text: "Password"),
            CustomInputWidget(
              keyboardType: TextInputType.text,
              obscuredText: !_passwordVisible!,
              controller: _passwordController,
              hintText: "Password",
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                // Check if the password has at least 8 characters using a regex pattern.
                if (value.length < 8) {
                  return "Password must have at least 8 characters";
                }
                return null;
              },
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible! ? Icons.visibility : Icons.visibility_off,
                  color: primary,
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible!;
                  });
                },
              ),
            ),
            const RememberMeWidget(),
            CustomLongBtnWidget(
              btnText: "Accept",
              bgColor: secondaryBtnPrimary,
              onPressed: () {},
            ),
            DontHaveAccountWidget(
              text: "Don't have an account?",
              btnText: "Create a new account",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

