import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/custom_checkbox_button.dart';
import 'package:vivu/widgets/custom_outlined_button.dart';
import 'package:vivu/widgets/custom_text_form_field.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController inputcodehereController = TextEditingController();

  bool iAgreeWithTheTermsAndCondition = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: 886.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildMainStack(context),
              _buildSignupSection(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildMainStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 461.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse211,
              height: 461.v,
              width: 428.h,
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgLogowhite1,
              height: 265.v,
              width: 324.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 29.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildVerificationSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Column(
        children: [
          Text(
            "Verification",
            style: CustomTextStyles.headlineSmallGray400,
          ),
          SizedBox(height: 24.v),
          Container(
            width: 280.h,
            margin: EdgeInsets.symmetric(horizontal: 18.h),
            child: Text(
              "The verification code will be sent to your registered phone number in 30s",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyMediumGray40001,
            ),
          ),
          SizedBox(height: 16.v),
          CustomTextFormField(
            controller: inputcodehereController,
            hintText: "Input code here",
            textInputAction: TextInputAction.done,
            borderDecoration: TextFormFieldStyleHelper.outlineGray,
          ),
          SizedBox(height: 13.v),
          Text(
            "Resend code",
            style: theme.textTheme.bodyMedium!.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildSignupSection(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(
          left: 32.h,
          right: 32.h,
          bottom: 5.v,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 23.h,
          vertical: 20.v,
        ),
        decoration: AppDecoration.outlineErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildVerificationSection(context),
            SizedBox(height: 47.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 6.h,
                  right: 53.h,
                ),
                child: CustomCheckboxButton(
                  alignment: Alignment.centerLeft,
                  text:
                      "I agree with the the terms & conditions and privacy policies",
                  isExpandedText: true,
                  value: iAgreeWithTheTermsAndCondition,
                  textStyle: CustomTextStyles.bodyMediumGray40001,
                  onChange: (value) {
                    iAgreeWithTheTermsAndCondition = value;
                  },
                ),
              ),
            ),
            SizedBox(height: 31.v),
            CustomOutlinedButton(
              text: "Sign up",
            ),
            SizedBox(height: 33.v),
          ],
        ),
      ),
    );
  }
}
