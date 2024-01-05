import '../widgets/paymentone_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';

class PaymentOneScreen extends StatelessWidget {
  const PaymentOneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.errorContainer.withOpacity(1),
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 52.v),
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 45.v),
                decoration: AppDecoration.fillOnPrimaryContainer
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL60),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 14.v),
                  _buildPaymentOne(context),
                  Spacer(),
                  CustomElevatedButton(
                      text: "Pay now",
                      margin: EdgeInsets.symmetric(horizontal: 31.h),
                      buttonStyle: CustomButtonStyles.fillSecondaryContainer)
                ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftOnprimarycontainer,
            margin: EdgeInsets.only(left: 39.h, top: 15.v, bottom: 20.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitle(text: "Payment"));
  }

  /// Section Widget
  Widget _buildPaymentOne(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 31.v);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return PaymentoneItemWidget(onTapView: () {
            onTapView(context);
          });
        });
  }

  /// Navigates to the payment2AmericaExpressScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.payment2AmericaExpressScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
