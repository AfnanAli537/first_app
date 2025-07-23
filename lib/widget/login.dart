import 'package:app1/content/forget_password.dart';
import 'package:app1/widget/otp.dart';
import 'package:app1/widget/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:app1/content/text_field.dart';
import 'package:app1/content/container.dart';
import 'package:app1/content/app_strings.dart';
import 'package:app1/content/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    String? phoneNumber;
    String? password;

    final screenWidth = MediaQuery.of(context).size.width;
    final fieldWidth = screenWidth * 0.8;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // const Spacer(),
          ContainerScreen(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Text(
                      AppStrings.loginScreenWelcomeText,
                      style: TextStyle(
                        color: AppColors.whiteApp,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Phone Field
                  SizedBox(
                    width: fieldWidth,
                    child: CustomInputField(
                      hintText: AppStrings.loginScreenPhonenumberTextFiled,
                      icon: Icons.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        return null;
                      },
                      onSaved: (value) => phoneNumber = value,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Password Field
                  SizedBox(
                    width: fieldWidth,
                    child: CustomInputField(
                      hintText: AppStrings.loginScreenPasswordTextFiled,
                      icon: Icons.lock,
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

                  const SizedBox(height: 8),

                  // Forget Password Row
                  SizedBox(
                    child: Align(
                      child: ForgetPasswordRow(
                        firstWhiteText: AppStrings.loginScreenForgetPass,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Login Button
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
                            msg:
                                "Logging in...\nPhone: $phoneNumber\npassword: $password",
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
                      child: const Text('Login'),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ForgetPasswordRow(
                      firstWhiteText: AppStrings.loginScreenNoAccount,
                      secoednBlcakText: AppStrings.loginScreenCreateAccount,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                        Fluttertoast.showToast(
                          msg: "Navigate to Create Account Screen",
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
      ),
    );
  }
}
