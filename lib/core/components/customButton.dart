import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/core/extensions/path_extensions.dart';
import '../themes/main_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final String? image;
  final String? family;
  final Color? color;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? verticalMargin;
  final double? horizontalMargin;
  final FontWeight? weight;
  final bool isTransparent;
  final bool withBorder;
  final Color? borderColor;
  final Color? textColor;
  final Color? imageColor;
  final double? width;
  final double? height;
  final double? hor;
  final double? ver;
  final double? font;

  CustomButton(
      {this.onPressed,
      required this.title,
      this.color,
      this.width,
      this.withBorder = false,
      this.verticalPadding,
      this.verticalMargin,
      this.horizontalPadding,
      this.horizontalMargin,
      this.family,
      this.weight,
      this.borderColor,
      this.hor,
      this.isTransparent = false,
      this.height,
      this.font,
      this.textColor,
      this.ver,
      this.image,
      this.imageColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin ?? 0.w,
            vertical: verticalMargin ?? 0.h),
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 10.h,
            horizontal: horizontalPadding ?? 30.w),
        height: height ?? 83.h,
        width: width ?? 542.w,
        decoration: BoxDecoration(
          color: isTransparent ? Colors.transparent : color ?? MainColors.kMainColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image == null
                ? SizedBox()
                : Image.asset(
                    image!.ast,
                    height: 35.h,
                    width: 40.w,
                  ),
            image == null
                ? SizedBox()
                : SizedBox(
                    width: 10.w,
                  ),
            Text(
              title,
              style: TextStyle(
                color: textColor ?? MainColors.kAccentColor,
                fontSize: font ?? 33.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
