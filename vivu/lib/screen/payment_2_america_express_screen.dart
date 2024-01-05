import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_checkbox_button.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';
import 'package:vivu/widgets/custom_text_form_field.dart';
import 'package:vivu/screen/payment_3_done_dialog.dart';

// ignore_for_file: must_be_immutable
class Payment2AmericaExpressScreen extends StatelessWidget {
  Payment2AmericaExpressScreen({Key? key}) : super(key: key);

  TextEditingController verificationCodeController = TextEditingController();

  bool checkmark = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.errorContainer.withOpacity(1),
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: 52.v),
                padding: EdgeInsets.symmetric(horizontal: 32.h, vertical: 45.v),
                decoration: AppDecoration.fillOnPrimaryContainer
                    .copyWith(borderRadius: BorderRadiusStyle.customBorderTL60),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 7.v),
                  _buildVerificationCode(context),
                  Spacer(),
                  CustomElevatedButton(
                      text: "Pay now",
                      margin: EdgeInsets.symmetric(horizontal: 31.h),
                      onPressed: () {
                        onTapPayNow(context);
                      })
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
  Widget _buildVerificationCode(BuildContext context) {
    return SizedBox(
        height: 293.v,
        width: 363.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
                  decoration: AppDecoration.outlineGray400.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder10),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 11.v),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                                height: 20.adaptSize,
                                width: 20.adaptSize,
                                margin: EdgeInsets.only(right: 9.h),
                                decoration: BoxDecoration(
                                    color: theme.colorScheme.primary,
                                    borderRadius:
                                        BorderRadius.circular(10.h)))),
                        SizedBox(height: 26.v),
                        Container(
                            width: 322.h,
                            margin: EdgeInsets.only(right: 9.h),
                            padding: EdgeInsets.symmetric(
                                horizontal: 21.h, vertical: 13.v),
                            decoration: AppDecoration.outlineGray4001,
                            child: Text("Phone Number",
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 11.v),
                        Container(
                            width: 245.h,
                            margin: EdgeInsets.only(left: 42.h, right: 43.h),
                            child: Text(
                                "The verification code will be sent to your phone number in 30s",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium)),
                        SizedBox(height: 9.v),
                        Padding(
                            padding: EdgeInsets.only(right: 9.h),
                            child: CustomTextFormField(
                                controller: verificationCodeController,
                                hintText: "Verification Code",
                                textInputAction: TextInputAction.done)),
                        SizedBox(height: 15.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: CustomCheckboxButton(
                                alignment: Alignment.centerLeft,
                                text: "Save E-Wallet Information",
                                value: checkmark,
                                padding: EdgeInsets.symmetric(vertical: 1.v),
                                onChange: (value) {
                                  checkmark = value;
                                }))
                      ]))),
          CustomImageView(
              imagePath: ImageConstant.imgMomo1,
              height: 85.v,
              width: 91.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 3.h))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Displays a dialog with the [Payment3DoneDialog] content.
  onTapPayNow(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: Payment3DoneDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
