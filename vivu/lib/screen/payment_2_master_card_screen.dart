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
class Payment2MasterCardScreen extends StatelessWidget {
  Payment2MasterCardScreen({Key? key}) : super(key: key);

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  bool saveCardInformation = false;

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
                            margin: EdgeInsets.only(top: 52.v),
                            padding: EdgeInsets.symmetric(
                                horizontal: 32.h, vertical: 45.v),
                            decoration: AppDecoration.fillOnPrimaryContainer
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.customBorderTL60),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(height: 14.v),
                                  _buildTwentyTwo(context),
                                  Spacer(),
                                  _buildPayNow(context)
                                ])))))));
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
  Widget _buildCardNumber(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: cardNumberController,
            hintText: "Card Number",
            textInputType: TextInputType.number));
  }

  /// Section Widget
  Widget _buildName(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.h, right: 14.h),
        child: CustomTextFormField(
            controller: nameController, hintText: "Card Holder’s Name"));
  }

  /// Section Widget
  Widget _buildCvv(BuildContext context) {
    return CustomTextFormField(
        width: 135.h,
        controller: cvvController,
        hintText: "CVV",
        textInputAction: TextInputAction.done,
        contentPadding:
            EdgeInsets.symmetric(horizontal: -83.h, vertical: 14.v));
  }

  /// Section Widget
  Widget _buildTwentyTwo(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
        decoration: AppDecoration.outlineGray400
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(right: 14.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomImageView(
                            imagePath:
                                ImageConstant.imgMastercardRemovebgPreview,
                            height: 45.v,
                            width: 75.h),
                        Container(
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(top: 12.v, bottom: 13.v),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(10.h)))
                      ]))),
          SizedBox(height: 13.v),
          _buildCardNumber(context),
          SizedBox(height: 8.v),
          _buildName(context),
          SizedBox(height: 8.v),
          Container(
              margin: EdgeInsets.only(left: 5.h, right: 14.h),
              decoration: AppDecoration.outlineGray4001,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            left: 18.h, top: 14.v, bottom: 14.v),
                        child: Text("DD/MM/YY",
                            style: theme.textTheme.bodyMedium)),
                    _buildCvv(context)
                  ])),
          SizedBox(height: 13.v),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 5.h),
                  child: CustomCheckboxButton(
                      alignment: Alignment.centerLeft,
                      text: "Save Card Information",
                      value: saveCardInformation,
                      padding: EdgeInsets.symmetric(vertical: 1.v),
                      onChange: (value) {
                        saveCardInformation = value;
                      })))
        ]));
  }

  /// Section Widget
  Widget _buildPayNow(BuildContext context) {
    return CustomElevatedButton(
        text: "Pay now",
        margin: EdgeInsets.symmetric(horizontal: 31.h),
        onPressed: () {
          onTapPayNow(context);
        });
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
