import 'package:fireauth/constants/asset_constants.dart';
import 'package:fireauth/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? indent;
  final double? endIndent;
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.indent,
    this.endIndent,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? ColorConstants.backgroundColor,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(bottom: 14.h),
        child: Text(
          title,
          style: TextStyle(
            color: titleColor ?? Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
        ),
      ),
      titleSpacing: -10.w,
      centerTitle: false,
      leading: IconButton(
        padding: EdgeInsets.only(bottom: 14.h),
        icon: SvgPicture.asset(
          AssetConstants.arrowLeftSvg,
          width: 24.w,
          height: 24.h,
          // ignore: deprecated_member_use
          color: titleColor ?? Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(36.h);
}
