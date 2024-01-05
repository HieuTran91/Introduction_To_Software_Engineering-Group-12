import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore: must_be_immutable
class CarlistItemWidget extends StatelessWidget {
  const CarlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80.h,
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 80.adaptSize,
          width: 80.adaptSize,
          padding: EdgeInsets.all(15.h),
          decoration: AppDecoration.outlineErrorContainer.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.imgLamboRemovebgPreview,
            height: 50.adaptSize,
            width: 50.adaptSize,
            alignment: Alignment.center,
          ),
        ),
      ),
    );
  }
}
