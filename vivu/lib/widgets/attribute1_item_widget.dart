import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore: must_be_immutable
class Attribute1ItemWidget extends StatelessWidget {
  const Attribute1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 39.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlineErrorContainer2.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgIcBaselineAir,
            height: 30.adaptSize,
            width: 30.adaptSize,
          ),
          SizedBox(height: 10.v),
          Text(
            "SEATS",
            style: theme.textTheme.titleSmall,
          ),
          SizedBox(height: 4.v),
          Text(
            "4",
            style: CustomTextStyles.titleSmallOnPrimaryContainer,
          ),
        ],
      ),
    );
  }
}
