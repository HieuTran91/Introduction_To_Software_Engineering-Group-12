import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';
import 'package:vivu/widgets/custom_outlined_button.dart';
import 'package:vivu/widgets/custom_text_form_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController fullNameEditTextController = TextEditingController();

  TextEditingController phoneNumberEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  TextEditingController addressEditTextController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                height: 886.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    _buildLoginStack(context),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 37.h,
                          right: 28.h,
                          bottom: 5.v,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 19.h,
                          vertical: 17.v,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusStyle.roundedBorder10,
                          image: DecorationImage(
                            image: fs.Svg(
                              ImageConstant.imgGroup70,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 71.h),
                                child: Text(
                                  "Sign up to join",
                                  style: CustomTextStyles.headlineSmallGray400,
                                ),
                              ),
                            ),
                            SizedBox(height: 17.v),
                            _buildFullNameEditText(context),
                            SizedBox(height: 19.v),
                            Container(
                              margin: EdgeInsets.only(
                                left: 1.h,
                                right: 9.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 19.h,
                                vertical: 9.v,
                              ),
                              decoration: AppDecoration.outlineGray.copyWith(
                                borderRadius: BorderRadiusStyle.roundedBorder22,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 3.v),
                                    child: Text(
                                      "DOB",
                                      style:
                                          CustomTextStyles.bodyMediumGray40001,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: 9.h,
                                      top: 3.v,
                                    ),
                                    child: Text(
                                      "dd/mm/yyyy",
                                      style:
                                          CustomTextStyles.bodyMediumGray40001,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 19.v),
                            _buildPhoneNumberEditText(context),
                            SizedBox(height: 19.v),
                            _buildPasswordEditText(context),
                            SizedBox(height: 19.v),
                            _buildAddressEditText(context),
                            SizedBox(height: 21.v),
                            Text(
                              "What is your role?",
                              style: CustomTextStyles.bodyMediumGray40001,
                            ),
                            SizedBox(height: 16.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(right: 9.h),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildCarRentalCustomerButton(context),
                                    _buildCarOwnerButton(context),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 33.v),
                            _buildSignUpButton(context),
                            SizedBox(height: 17.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 150.h),
                                child: Text(
                                  "or",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.v),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 29.v,
                                width: 203.h,
                                margin: EdgeInsets.only(left: 56.h),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: 20.h,
                                          bottom: 1.v,
                                        ),
                                        child: Text(
                                          "Sign up with Google",
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 29.v,
                                        width: 203.h,
                                        child: Stack(
                                          alignment: Alignment.centerLeft,
                                          children: [
                                            CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgRectangle65,
                                              height: 29.v,
                                              width: 203.h,
                                              radius: BorderRadius.circular(
                                                14.h,
                                              ),
                                              alignment: Alignment.center,
                                            ),
                                            CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgFlatColorIconsGoogle,
                                              height: 19.adaptSize,
                                              width: 19.adaptSize,
                                              alignment: Alignment.centerLeft,
                                              margin:
                                                  EdgeInsets.only(left: 15.h),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16.v),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginStack(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 461.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse21461x428,
              height: 461.v,
              width: 428.h,
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgLogowhite1,
              height: 121.v,
              width: 181.h,
              alignment: Alignment.topCenter,
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildFullNameEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 9.h,
      ),
      child: CustomTextFormField(
        controller: fullNameEditTextController,
        hintText: "Full name",
        borderDecoration: TextFormFieldStyleHelper.outlineGray,
      ),
    );
  }

  /// Section Widget
  Widget _buildPhoneNumberEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 9.h,
      ),
      child: CustomTextFormField(
        controller: phoneNumberEditTextController,
        hintText: "Phone number",
        textInputType: TextInputType.phone,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(23.h, 11.v, 12.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgCarbonemail,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 45.v,
        ),
        contentPadding: EdgeInsets.only(
          top: 12.v,
          right: 30.h,
          bottom: 12.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineGray,
      ),
    );
  }

  /// Section Widget
  Widget _buildPasswordEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 9.h,
      ),
      child: CustomTextFormField(
        controller: passwordEditTextController,
        hintText: "Password",
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(23.h, 11.v, 12.h, 10.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgRilockpasswordfill,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 45.v,
        ),
        obscureText: true,
        contentPadding: EdgeInsets.only(
          top: 12.v,
          right: 30.h,
          bottom: 12.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineGray,
      ),
    );
  }

  /// Section Widget
  Widget _buildAddressEditText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.h,
        right: 9.h,
      ),
      child: CustomTextFormField(
        controller: addressEditTextController,
        hintText: "Address",
        textInputAction: TextInputAction.done,
        prefix: Container(
          margin: EdgeInsets.fromLTRB(23.h, 10.v, 12.h, 11.v),
          child: CustomImageView(
            imagePath: ImageConstant.imgCarbonemailGray400,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
        prefixConstraints: BoxConstraints(
          maxHeight: 45.v,
        ),
        contentPadding: EdgeInsets.only(
          top: 12.v,
          right: 30.h,
          bottom: 12.v,
        ),
        borderDecoration: TextFormFieldStyleHelper.outlineGray,
      ),
    );
  }

  /// Section Widget
  Widget _buildCarRentalCustomerButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 45.v,
        text: "Car Rental Customer",
        margin: EdgeInsets.only(right: 7.h),
        buttonStyle: CustomButtonStyles.fillErrorContainer,
        buttonTextStyle: theme.textTheme.labelLarge!,
      ),
    );
  }

  /// Section Widget
  Widget _buildCarOwnerButton(BuildContext context) {
    return Expanded(
      child: CustomElevatedButton(
        height: 45.v,
        text: "Car Owner",
        margin: EdgeInsets.only(left: 7.h),
        buttonStyle: CustomButtonStyles.fillErrorContainer,
        buttonTextStyle: theme.textTheme.labelLarge!,
      ),
    );
  }

  /// Section Widget
  Widget _buildSignUpButton(BuildContext context) {
    return CustomOutlinedButton(
      text: "Sign up",
      margin: EdgeInsets.only(
        left: 1.h,
        right: 9.h,
      ),
    );
  }
}
