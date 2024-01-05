import '../widgets/userprofilegrid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';

class CarManagementScreen extends StatelessWidget {
  const CarManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 1.v),
                  _buildBmwiTwoStack(context),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 11.h, vertical: 22.v),
                      decoration: AppDecoration.fillErrorContainer.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL60),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildBmwiRow(context),
                            SizedBox(height: 3.v),
                            Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text("24.99 per day",
                                    style:
                                        CustomTextStyles.titleMediumGray400)),
                            SizedBox(height: 29.v),
                            Padding(
                                padding: EdgeInsets.only(left: 11.h),
                                child: Text("Features",
                                    style: CustomTextStyles.titleLargeMedium)),
                            SizedBox(height: 3.v),
                            _buildUserProfileGrid(context),
                            SizedBox(height: 17.v),
                            _buildConfirmRow(context),
                            SizedBox(height: 38.v)
                          ]))
                ]))));
  }

  /// Section Widget
  Widget _buildBmwiTwoStack(BuildContext context) {
    return SizedBox(
        height: 338.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 338.v,
                  width: double.maxFinite,
                  child: Stack(alignment: Alignment.topRight, children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgBmw320i2,
                        height: 338.v,
                        width: 428.h,
                        alignment: Alignment.center),
                    CustomImageView(
                        imagePath: ImageConstant.imgFaSolidEditGray400,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 35.v, right: 11.h))
                  ]))),
          CustomImageView(
              imagePath: ImageConstant.imgArrowLeftErrorcontainer,
              height: 20.v,
              width: 10.h,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 39.h, top: 15.v),
              onTap: () {
                onTapImgArrowLeft(context);
              })
        ]));
  }

  /// Section Widget
  Widget _buildBmwiRow(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 4.v),
                      child: Text("BMW 320i",
                          style: theme.textTheme.headlineSmall)),
                  CustomImageView(
                      imagePath: ImageConstant.imgFaSolidEditGray400,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: EdgeInsets.only(left: 16.h, bottom: 16.v)),
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgStar125x25,
                      height: 25.adaptSize,
                      width: 25.adaptSize,
                      margin: EdgeInsets.only(top: 12.v, bottom: 3.v)),
                  Padding(
                      padding:
                          EdgeInsets.only(left: 6.h, top: 10.v, bottom: 2.v),
                      child: Text("4.8", style: theme.textTheme.titleMedium))
                ])));
  }

  /// Section Widget
  Widget _buildUserProfileGrid(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 4.h),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 129.v,
                crossAxisCount: 2,
                mainAxisSpacing: 19.h,
                crossAxisSpacing: 19.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return UserprofilegridItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildConfirmRow(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 7.v),
                      child:
                          Text("24.99", style: theme.textTheme.headlineSmall)),
                  CustomElevatedButton(
                      width: 166.h,
                      text: "Confirm",
                      buttonStyle: CustomButtonStyles.fillPrimary,
                      onPressed: () {
                        onTapConfirm(context);
                      })
                ])));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the setDateScreen when the action is triggered.
  onTapConfirm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setDateScreen);
  }
}
