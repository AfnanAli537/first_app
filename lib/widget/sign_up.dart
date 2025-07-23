import 'package:app1/content/app_strings.dart';
import 'package:app1/content/container.dart';
import 'package:app1/content/forget_password.dart';
import 'package:app1/content/text_field.dart';
import 'package:app1/widget/login.dart';
import 'package:app1/widget/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? firstName;
    String? lastName;
    String? email;
    String? phoneNumber;
    String? password;
    String? confirmPassword;

    final screenWidth = MediaQuery.of(context).size.width;
    final fieldWidth = screenWidth * 0.8;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ContainerScreen(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppStrings.signUpScreenTitle,
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: fieldWidth,
                  child: CustomInputField(
                    hintText: AppStrings.firstNameTextField,
                    icon: Icons.person_2_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onSaved: (value) => firstName = value,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: fieldWidth,
                  child: CustomInputField(
                    hintText: AppStrings.lastNameTextField,
                    icon: Icons.person_2_outlined,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onSaved: (value) => lastName = value,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: fieldWidth,
                  child: CustomInputField(
                    hintText: AppStrings.emailTextField,
                    icon: Icons.email,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) => email = value,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: fieldWidth,
                  child: CustomInputField(
                    hintText: AppStrings.loginScreenPhonenumberTextFiled,
                    icon: Icons.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 10) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                    onSaved: (value) => phoneNumber = value,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: fieldWidth,
                  child: CustomInputField(
                    hintText: AppStrings.loginScreenPasswordTextFiled,
                    icon: Icons.lock,
                    suffixIcon: Icons.visibility,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (value) => password = value,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: fieldWidth,
                  child: CustomInputField(
                    hintText: AppStrings.loginScreenConfirmPasswordTextFiled,
                    icon: Icons.lock,
                    suffixIcon: Icons.visibility,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onSaved: (value) => password = value,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: fieldWidth / 2,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        Fluttertoast.showToast(
                          msg: "signing up all data saved...",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor:
                              const Color.fromARGB(255, 150, 185, 206),
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const OtpVerificationScreen()),
                        );
                      }
                    },
                    child: const Text('sign up '),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 10),
                  child: ForgetPasswordRow(
                    firstWhiteText: AppStrings.signUpScreenAlreadyHaveAccount,
                    secoednBlcakText: AppStrings.signUpScreenLoginText,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                      Fluttertoast.showToast(
                        msg: "Navigate to Login Screen",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor:
                            const Color.fromARGB(255, 150, 185, 206),
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
