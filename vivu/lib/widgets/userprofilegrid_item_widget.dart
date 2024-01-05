import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore: must_be_immutable
class UserprofilegridItemWidget extends StatelessWidget {
  const UserprofilegridItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128.v,
      width: 120.h,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 24.h,
                vertical: 16.v,
              ),
              decoration: AppDecoration.outlineErrorContainer2.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgFluentTopSpeed24Filled,
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                  ),
                  SizedBox(height: 9.v),
                  Text(
                    "TOP SPEED",
                    style: theme.textTheme.titleSmall,
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    "280 km/h",
                    style: CustomTextStyles.titleSmallOnPrimaryContainer,
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFaSolidEditGray400,
            height: 24.adaptSize,
            width: 24.adaptSize,
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
