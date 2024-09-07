import 'package:fireauth/constants/app_constants.dart';
import 'package:fireauth/constants/asset_constants.dart';
import 'package:fireauth/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Widget? suffix;
  final bool? obscureText;
  final int? maxLength;
  final double? maxHeight;
  final double? maxWidth;
  final bool? showTitle;
  final String? label;
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.controller,
    this.suffix,
    this.obscureText,
    this.maxLength,
    this.maxHeight,
    this.showTitle,
    this.label,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 9.sp,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        12.verticalSpace,
        TextFormField(
          maxLength: maxLength,
          maxLines: maxLength ?? 1,
          obscureText: obscureText ?? false,
          controller: controller,
          autofocus: false,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.only(bottom: 8.h, top: 8.h, left: 10.w, right: 2.w),
            constraints: BoxConstraints(
                maxHeight: maxHeight ?? 34.h, maxWidth: maxWidth ?? 324.w),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: showTitle == true || showTitle == null && label == null
                ? 'Enter your ${title.toLowerCase()}'
                : label,
            labelStyle: TextStyle(
              color: ColorConstants.labelColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: suffix,
            border: outlinedBorder(),
            enabledBorder: outlinedBorder(),
            disabledBorder: outlinedBorder(),
            focusedBorder: outlinedBorder(),
            counterStyle: TextStyle(
              color: Colors.black,
              fontSize: 9.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          cursorHeight: 12.h,
          cursorColor: ColorConstants.rosePink,
        ),
      ],
    );
  }
}

class PasswordFormField extends StatefulWidget {
  final TextEditingController paswordController;
  const PasswordFormField({super.key, required this.paswordController});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

bool obscureText = true;

class _PasswordFormFieldState extends State<PasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      title: 'Password',
      controller: widget.paswordController,
      obscureText: obscureText,
      suffix: IconButton(
        onPressed: () => setState(() => obscureText = !obscureText),
        icon: SvgPicture.asset(
          obscureText == true ? AssetConstants.showSvg : AssetConstants.hideSvg,
        ),
      ),
    );
  }
}

OutlineInputBorder outlinedBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: AppConstants.borderWidth,
    ),
    borderRadius: AppConstants.radiusCircular6,
  );
}
