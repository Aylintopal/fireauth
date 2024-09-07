
import 'package:fireauth/authentication/pages/login_page.dart';
import 'package:fireauth/authentication/pages/register_page.dart';
import 'package:fireauth/authentication/widgets/custom_app_button.dart';
import 'package:fireauth/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.red,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'FireAuth',
              style: TextStyle(
                color: Colors.white,
                fontSize: 42.sp,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
            12.verticalSpace,
            Text(
              'Login or Sign up',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            82.verticalSpace,
            CustomAppButton(
              buttonText: 'Sign Up',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              buttonColor: Colors.white,
              buttonTextColor: ColorConstants.red,
            ),
            12.verticalSpace,
            CustomAppButton(
              buttonText: 'Login',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              borderColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
