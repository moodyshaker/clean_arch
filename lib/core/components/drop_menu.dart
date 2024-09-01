import 'package:flutter/material.dart';
import 'package:my_app/core/extensions/path_extensions.dart';
import 'package:my_app/core/extensions/size_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/main_colors.dart';
import 'main_text.dart';

class DropMenu extends StatelessWidget {
  final List<String>? items;
  final List<dynamic>? dynamicItems;
  final bool isDynamicData;
  final Function(String?)? onChanged;
  final String? Function(String?)? valid;
  final String hint;
  final bool shouldBeEmpty;
  final Color? headerTextColor;
  final Function()? onTap;
  final dynamic value;
  final bool isModel;
  final double? hintFont;
  final double? textFont;
  final double? itemTextFont;
  final Color? hintColor;
  final Color? textColor;
  final Color? itemTextColor;
  final String? textFamily;
  final String? hintFamily;
  final String? itemTextFamily;
  final String? family;
  final double? width;
  final Widget? prefixIcon;
  final Color? dropDownColor;

  DropMenu(
      {this.value,
      required this.hint,
      this.shouldBeEmpty = false,
      this.isDynamicData = false,
      this.dynamicItems,
      this.valid,
      this.width,
      this.dropDownColor,
      this.family,
      this.items,
      this.itemTextColor,
      this.itemTextFamily,
      this.itemTextFont,
      this.textColor,
      this.textFont,
      this.textFamily,
      this.hintFont,
      this.hintColor,
      this.hintFamily,
      this.prefixIcon,
      this.onChanged,
      this.headerTextColor,
      this.onTap,
      this.isModel = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 542.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.16))
      ]),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonFormField<String>(
            borderRadius: BorderRadius.circular(20.r),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.r),
              ),
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: IconButton(
                        icon: prefixIcon!,
                        onPressed: () {},
                      ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20.r),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              filled: true,
              fillColor: MainColors.kAccentColor,
            ),
            selectedItemBuilder: (BuildContext ctx) => isDynamicData
                ? dynamicItems!
                    .map((e) => Row(
                          children: [
                            Image.asset(
                              e['image'].ast,
                              height: 30.h,
                              width: 30.w,
                            ),
                            30.wSpace,
                            Text(
                              e['title'],
                              style: TextStyle(
                                fontSize: textFont ?? 25.sp,
                                color: textColor ?? MainColors.kBlackColor,
                              ),
                            ),
                          ],
                        ))
                    .toList()
                : items!
                    .map(
                      (e) => Text(
                        e,
                        style: TextStyle(
                          fontSize: textFont ?? 25.sp,
                          color: textColor ?? MainColors.kBlackColor,
                        ),
                      ),
                    )
                    .toList(),
            dropdownColor: dropDownColor ?? Colors.white,
            validator: valid,
            value: value,
            icon: Image.asset(
              'drop_down_arrow'.ast,
              height: 9.h,
              width: 17.h,
            ),
            hint: Text(
                value == null
                    ? hint
                    : isModel
                        ? value.name
                        : value,
                style: TextStyle(
                  fontSize: hintFont ?? 25.sp,
                  color: hintColor ?? MainColors.kBlackColor,
                )),
            iconEnabledColor: MainColors.kAccentColor,
            isExpanded: true,
            items: isDynamicData
                ? dynamicItems == null || dynamicItems!.isEmpty || shouldBeEmpty
                    ? []
                    : dynamicItems!
                        .map((e) => DropdownMenuItem<String>(
                            value: dynamicItems![dynamicItems!.indexOf(e)]
                                ['title'],
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      e['image'].ast,
                                      height: 30.h,
                                      width: 30.w,
                                    ),
                                    30.wSpace,
                                    Text(
                                      e['title'],
                                      style: TextStyle(
                                        fontSize: textFont ?? 25.sp,
                                        color:
                                            textColor ?? MainColors.kBlackColor,
                                      ),
                                    ),
                                  ],
                                ),
                                if (e != dynamicItems!.last) Divider(),
                              ],
                            )))
                        .toList()
                : items == null || items!.isEmpty || shouldBeEmpty
                    ? []
                    : items!
                        .map((e) => DropdownMenuItem<String>(
                              value: items![items!.indexOf(e)],
                              child: Text(
                                e,
                                style: TextStyle(
                                  fontSize: itemTextFont ?? 25.sp,
                                  color:
                                      itemTextColor ?? MainColors.kBlackColor,
                                ),
                              ),
                            ))
                        .toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
