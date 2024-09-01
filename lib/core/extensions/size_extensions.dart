import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension NumberExtensions on num {
  SizedBox get hSpace => SizedBox(height: h.toDouble());

  SizedBox get wSpace => SizedBox(width: w.toDouble());
}