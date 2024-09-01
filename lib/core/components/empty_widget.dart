import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'main_text.dart';

class EmptyWidget extends StatelessWidget {
  final String title;

  const EmptyWidget(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainText(
        text: title,
        font: 16.sp,
      ),
    );
  }
}
