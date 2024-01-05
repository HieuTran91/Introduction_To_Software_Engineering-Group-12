import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';
import 'package:vivu/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class DriverDetailsTwoScreen extends StatelessWidget {
  DriverDetailsTwoScreen({Key? key}) : super(key: key);

  TextEditingController licenceNumbervalueController = TextEditingController();

  TextEditingController expirydateController = TextEditingController();

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
                                  SizedBox(height: 29.v),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: EdgeInsets.only(left: 5.h),
                                          child: Text("Driving Licence",
                                              style: CustomTextStyles
                                                  .titleLargeErrorContainer_1))),
                                  SizedBox(height: 12.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.h, right: 6.h),
                                      child: CustomTextFormField(
                                          controller:
                                              licenceNumbervalueController,
                                          hintText: "Licence Number",
                                          hintStyle: CustomTextStyles
                                              .titleLargeGray400,
                                          textInputType: TextInputType.number,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 17.h, vertical: 20.v),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .outlineGrayTL5)),
                                  SizedBox(height: 34.v),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 5.h, right: 6.h),
                                      child: CustomTextFormField(
                                          controller: expirydateController,
                                          hintText: "Expiry Date",
                                          hintStyle: CustomTextStyles
                                              .titleLargeGray400,
                                          textInputAction: TextInputAction.done,
                                          contentPadding: EdgeInsets.symmetric(
                                              horizontal: 17.h, vertical: 20.v),
                                          borderDecoration:
                                              TextFormFieldStyleHelper
                                                  .outlineGrayTL5)),
                                  SizedBox(height: 87.v),
                                  Text("Upload your licence phone",
                                      style: CustomTextStyles
                                          .titleLargeErrorContainer_1),
                                  SizedBox(height: 79.v),
                                  Container(
                                      height: 150.v,
                                      width: 200.h,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 57.h, vertical: 38.v),
                                      decoration: AppDecoration.fillGray10001
                                          .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder10),
                                      child: CustomImageView(
                                          imagePath: ImageConstant.imgCamera,
                                          height: 71.v,
                                          width: 84.h,
                                          alignment: Alignment.topCenter)),
                                  SizedBox(height: 81.v),
                                  CustomElevatedButton(
                                      text: "Check out",
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 36.h)),
                                  SizedBox(height: 5.v)
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
                  width: 363.h,
                  child: Divider(color: theme.colorScheme.primary))),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 10.adaptSize,
                  width: 10.adaptSize,
                  decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
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

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
