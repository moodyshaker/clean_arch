import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/core/extensions/size_extensions.dart';
import '../themes/main_colors.dart';
import 'main_text.dart';

class ActionDialog extends StatelessWidget {
  final String? content;
  final String? approveAction;
  final ShapeBorder? shape;
  final String? cancelAction;
  final VoidCallback? onApproveClick;
  final VoidCallback? onCancelClick;

  const ActionDialog({
    this.content,
    this.shape,
    this.approveAction,
    this.cancelAction,
    this.onApproveClick,
    this.onCancelClick,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Dialog(
        backgroundColor: MainColors.kAccentColor,
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              content != null
                  ? MainText(
                      text: content!,
                      font: 16.sp,
                      color: MainColors.kBlackColor,
                      textAlign: TextAlign.center,
                    )
                  : Container(),
              content != null ? 10.hSpace : Container(),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                onApproveClick != null || approveAction != null
                    ? ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  100.0.r,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MainColors.kPrimaryColor)),
                        onPressed: onApproveClick,
                        child: MainText(
                          text: approveAction ?? '',
                          color: MainColors.kAccentColor,
                          font: 14.sp,
                        ),
                      )
                    : Container(),
                ((onApproveClick != null || approveAction != null) &&
                        (onCancelClick != null || cancelAction != null))
                    ? 10.w.wSpace
                    : Container(),
                onCancelClick != null || cancelAction != null
                    ? ElevatedButton(
                        onPressed: onCancelClick,
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  100.r,
                                ),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MainColors.kPrimaryColor)),
                        child: MainText(
                            text: cancelAction ?? '',
                            color: MainColors.kAccentColor,
                            font: 14.sp),
                      )
                    : Container()
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
