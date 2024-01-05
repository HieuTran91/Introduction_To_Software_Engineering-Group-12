import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore: must_be_immutable
class PaymentoneItemWidget extends StatelessWidget {
  PaymentoneItemWidget({
    Key? key,
    this.onTapView,
  }) : super(
          key: key,
        );

  VoidCallback? onTapView;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapView!.call();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10.h,
          vertical: 11.v,
        ),
        decoration: AppDecoration.outlineGray400.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder5,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgMastercardRemovebgPreview,
              height: 45.v,
              width: 75.h,
              margin: EdgeInsets.only(top: 1.v),
            ),
            Container(
              height: 20.adaptSize,
              width: 20.adaptSize,
              margin: EdgeInsets.only(
                top: 13.v,
                right: 14.h,
                bottom: 13.v,
              ),
              decoration: BoxDecoration(
                color: appTheme.gray400,
                borderRadius: BorderRadius.circular(
                  10.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
