import 'package:fireauth/constants/app_constants.dart';
import 'package:fireauth/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  final String? buttonText;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final Color? borderColor;
  final Widget? leading;
  final Widget? trailing;
  final double? height;
  final double? width;
  const CustomAppButton({
    super.key,
    this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.buttonTextColor,
    this.borderColor,
    this.leading,
    this.trailing,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 324.w,
      height: height ?? 34.h,
      decoration: BoxDecoration(
        color: buttonColor ?? ColorConstants.red,
        borderRadius: AppConstants.radiusCircular6,
        border: Border.all(
          color: borderColor ?? ColorConstants.red,
          width: AppConstants.borderWidth,
        ),
      ),
      child: ListTile(
        dense: true,
        title: buttonText != null
            ? Text(
                buttonText!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: buttonTextColor ?? Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              )
            : null,
        leading: leading ?? const SizedBox.shrink(),
        trailing: trailing ?? const SizedBox.shrink(),
        contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
        onTap: onPressed,
        visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      ),
    );

  }
}

