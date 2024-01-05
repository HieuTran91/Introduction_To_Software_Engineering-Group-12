import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';
import 'package:vivu/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class DriverDetailsScreen extends StatelessWidget {
  DriverDetailsScreen({Key? key}) : super(key: key);

  TextEditingController personalDataController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.errorContainer.withOpacity(1),
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.only(top: 6.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 27.h, vertical: 26.v),
                            decoration: AppDecoration.fillOnPrimaryContainer
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderTL60),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildLineOne(context),
                                  SizedBox(height: 27.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Text("personal Data",
                                              style: CustomTextStyles
                                                  .titleLargeErrorContainer_1))),
                                  SizedBox(height: 14.v),
                                  _buildPersonalData(context),
                                  SizedBox(height: 31.v),
                                  _buildFullName(context),
                                  SizedBox(height: 31.v),
                                  _buildPhoneNumber(context),
                                  SizedBox(height: 31.v),
                                  _buildAddress(context),
                                  Spacer(),
                                  SizedBox(height: 19.v),
                                  _buildNext(context)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftOnprimarycontainer,
            margin: EdgeInsets.only(left: 39.h, top: 18.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarSubtitle(
            text: "Information", margin: EdgeInsets.only(left: 118.h)));
  }

  /// Section Widget
  Widget _buildLineOne(BuildContext context) {
    return SizedBox(
        height: 10.v,
        width: 372.h,
        child: Stack(alignment: Alignment.centerRight, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: 363.h, child: Divider(color: appTheme.gray400))),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                  decoration: BoxDecoration(
                      color: appTheme.gray400,
                      borderRadius: BorderRadius.circular(5.h)))),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(5.h))))
        ]));
  }

  /// Section Widget
  Widget _buildPersonalData(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: personalDataController,
            hintText: "Full Name",
            hintStyle: CustomTextStyles.titleLargeGray400,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 6.h),
        child: CustomTextFormField(
            controller: fullNameController,
            hintText: "Phone Number",
            hintStyle: CustomTextStyles.titleLargeGray400,
            textInputType: TextInputType.phone,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 17.h, vertical: 20.v),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5));
  }

  /// Section Widget
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 6.h),
        child: CustomTextFormField(
            controller: phoneNumberController,
            hintText: "address",
            hintStyle: CustomTextStyles.titleLargeGray400,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 17.h, vertical: 20.v),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5));
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.h),
        child: CustomTextFormField(
            controller: addressController,
            hintText: "National Identiy Number",
            hintStyle: CustomTextStyles.titleLargeGray400,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.number,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.h, vertical: 20.v),
            borderDecoration: TextFormFieldStyleHelper.outlineGrayTL5));
  }

  /// Section Widget
  Widget _buildNext(BuildContext context) {
    return CustomElevatedButton(
        text: "Next", margin: EdgeInsets.symmetric(horizontal: 36.h),
        onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Assuming you have a route named 'driverDetailsTwoScreen' set up
          Navigator.pushNamed(context, AppRoutes.driverDetailsTwoScreen);
        }
      },);
        
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
