import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../themes/main_colors.dart';
import 'main_text.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final double? width;
  final double? hintFont;
  final double? textFont;
  final double? horizontalContentPadding;
  final double? verticalContentPadding;
  final Color? hintColor;
  final Color? textColor;
  final String? textFamily;
  final String? hintFamily;
  final String? errorFamily;
  final int? maxLength;
  final bool nullMax;
  final TextInputType? type;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String?)? onsave;
  final Function(String?)? onChange;
  final Function()? iconCallback;
  final String? Function(String?)? valid;
  final AutovalidateMode? validationMode;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool isPassword;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final bool? read;
  final FocusNode? focus;
  final bool autoFocus;
  final bool isPhone;
  final bool? flag;
  final TextAlign? align;
  final TextInputAction? action;

  CustomTextField({
    this.hint,
    this.maxLines,
    this.errorFamily,
    this.hintFont,
    this.textFont,
    this.verticalContentPadding,
    this.horizontalContentPadding,
    this.textFamily,
    this.hintFamily,
    this.textColor,
    this.onsave,
    this.width,
    this.onTap,
    this.minLines,
    this.hintColor,
    this.suffixIcon,
    this.type,
    this.maxLength,
    this.nullMax = false,
    this.inputFormatters,
    this.fillColor,
    this.valid,
    this.action,
    this.align,
    this.onChange,
    this.isPassword = false,
    this.iconCallback,
    this.controller,
    this.isPhone = false,
    this.focus,
    this.autoFocus = false,
    this.prefixIcon,
    this.read,
    this.flag,
    this.validationMode,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 542.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.16))
      ]),
      child: TextFormField(
        onTap: widget.onTap,
        validator: widget.valid,
        controller: widget.controller,
        cursorColor: MainColors.kGreyColor,
        onSaved: widget.onsave,
        focusNode: widget.focus,
        inputFormatters: widget.inputFormatters,
        textAlign: widget.align ?? TextAlign.start,
        textInputAction: widget.action,
        readOnly: widget.read == true ? true : false,
        maxLines:
            widget.nullMax ? null : widget.maxLines ?? widget.minLines ?? 1,
        minLines: widget.minLines,
        autofocus: widget.autoFocus,
        maxLength: widget.isPhone ? 11 : widget.maxLength,
        obscureText: widget.isPassword ? true : false,
        keyboardType: widget.type,
        onChanged: widget.onChange,
        style: TextStyle(
          fontSize: widget.textFont ?? 30.sp,
          color: widget.textColor ?? MainColors.kBlackColor,
        ),
        decoration: InputDecoration(
          errorStyle: TextStyle(
            fontSize: 20.sp,
          ),
          hintText: widget.hint,
          fillColor: widget.fillColor ?? MainColors.kAccentColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: widget.horizontalContentPadding ?? 20.w,
              vertical: widget.verticalContentPadding ?? 10.h),
          prefixIcon: widget.prefixIcon != null
              ? Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 25.h, horizontal: 25.w),
                  child: widget.prefixIcon,
                )
              : null,
          counterText: '',
          hintStyle: TextStyle(
            fontSize: widget.hintFont ?? 30.sp,
            color: widget.hintColor ?? MainColors.kGreyColor,
          ),
          suffixIcon: widget.suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
