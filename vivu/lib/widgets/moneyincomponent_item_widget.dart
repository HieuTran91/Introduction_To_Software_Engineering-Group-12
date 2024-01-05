import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore: must_be_immutable
class MoneyincomponentItemWidget extends StatelessWidget {
  const MoneyincomponentItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 14.v,
      ),
      decoration: AppDecoration.outlineIndigoA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      width: 156.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "Money In",
              style: CustomTextStyles.bodyMediumRubikPrimaryContainer,
            ),
          ),
          SizedBox(height: 11.v),
          Row(
            children: [
              Text(
                "+ 3,456.98",
                style: CustomTextStyles.titleMediumRubikPrimaryContainer,
              ),
              CustomImageView(
                imagePath: ImageConstant.imgUp,
                height: 8.v,
                width: 15.h,
                margin: EdgeInsets.only(
                  left: 11.h,
                  top: 8.v,
                  bottom: 2.v,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
