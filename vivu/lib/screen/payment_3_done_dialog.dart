import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore_for_file: must_be_immutable
class Payment3DoneDialog extends StatelessWidget {
  const Payment3DoneDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.h,
      padding: EdgeInsets.symmetric(
        horizontal: 86.h,
        vertical: 66.v,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 11.v),
          CustomImageView(
            imagePath: ImageConstant.imgCheckmarkPrimary,
            height: 100.adaptSize,
            width: 100.adaptSize,
          ),
          SizedBox(height: 21.v),
          Text(
            "Succesfully  Done",
            style: CustomTextStyles.titleLargePrimary,
          ),
        ],
      ),
    );
  }
}
