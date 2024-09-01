import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/core/extensions/path_extensions.dart';
import 'package:my_app/core/extensions/size_extensions.dart';
import '../themes/main_colors.dart';
import 'main_text.dart';

class RetryWidget extends StatelessWidget {
  const RetryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            '404_image'.ast,
            height: 198.h,
            width: 203.w,
          ),
          10.hSpace,
          MainText(
            text: 'التطبيق غير متاح حاليا',
            font: 20.sp,
            color: MainColors.kMainColor,
          ),
          4.hSpace,
          MainText(
            text:
                'حياك الله نعمل حاليا علي صيانة التطبيق الرجاء دخول التطبيق في وقت لاحقا',
            font: 16.sp,
            color: MainColors.kGreyColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
