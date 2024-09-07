import 'package:fireauth/authentication/widgets/custom_app_button.dart';
import 'package:fireauth/authentication/widgets/custom_appbar.dart';
import 'package:fireauth/authentication/widgets/custom_text_form_field.dart';
import 'package:fireauth/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthUiScreen extends StatelessWidget {
  final String appBarTitle;
  final String pageTitle;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback buttonOnPressed;
  final bool? showForgotButton;
  const AuthUiScreen({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.buttonOnPressed,
    required this.appBarTitle,
    required this.pageTitle,
    this.showForgotButton,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(color: ColorConstants.red),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(
                  title: appBarTitle,
                  backgroundColor: ColorConstants.red,
                  titleColor: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 14.h, left: 20.w),
                  child: Text(
                    pageTitle,
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 25.w,
              right: 25.w,
              bottom: 24.h,
              top: 14.h,
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    title: 'Email',
                    controller: emailController,
                  ),
                  12.verticalSpace,
                  PasswordFormField(paswordController: passwordController),
                  showForgotButton == true
                      ? Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.zero),
                              visualDensity: const VisualDensity(
                                  horizontal: -4, vertical: -4),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: ColorConstants.red,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  const Spacer(),
                  CustomAppButton(
                    buttonText: 'Next',
                    onPressed: buttonOnPressed,
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
