import '../widgets/attribute_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';

class EditCarInfoScreen extends StatelessWidget {
  const EditCarInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 1.v),
                  _buildBmwiTwo(context),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.h, vertical: 26.v),
                      decoration: AppDecoration.fillErrorContainer.copyWith(
                          borderRadius: BorderRadiusStyle.customBorderTL60),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        _buildBmwi(context),
                        SizedBox(height: 29.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 7.h),
                                child: Text("Features",
                                    style: CustomTextStyles.titleLargeMedium))),
                        SizedBox(height: 9.v),
                        _buildAttribute(context),
                        SizedBox(height: 17.v),
                        _buildEditInfo(context),
                        SizedBox(height: 5.v)
                      ]))
                ]))));
  }

  /// Section Widget
  Widget _buildBmwiTwo(BuildContext context) {
    return SizedBox(
        height: 338.v,
        width: double.maxFinite,
        child: Stack(alignment: Alignment.topCenter, children: [
          CustomImageView(
              imagePath: ImageConstant.imgBmw320i2,
              height: 338.v,
              width: 428.h,
              alignment: Alignment.center),
          CustomAppBar(
              height: 35.v,
              leadingWidth: double.maxFinite,
              leading: AppbarLeadingImage(
                  imagePath: ImageConstant.imgArrowLeftErrorcontainer,
                  margin: EdgeInsets.only(left: 39.h, right: 379.h),
                  onTap: () {
                    onTapArrowLeft(context);
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildBmwi(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
              padding: EdgeInsets.only(right: 1.h),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text("BMW 320i", style: theme.textTheme.headlineSmall),
                Spacer(),
                CustomImageView(
                    imagePath: ImageConstant.imgStar1,
                    height: 25.adaptSize,
                    width: 25.adaptSize,
                    margin: EdgeInsets.only(top: 7.v, bottom: 3.v)),
                Padding(
                    padding: EdgeInsets.only(left: 6.h, top: 6.v, bottom: 2.v),
                    child: Text("4.8", style: theme.textTheme.titleMedium))
              ])),
          SizedBox(height: 3.v),
          Text("24.99 per day", style: CustomTextStyles.titleMediumGray400)
        ]));
  }

  /// Section Widget
  Widget _buildAttribute(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 121.v,
            crossAxisCount: 3,
            mainAxisSpacing: 1.h,
            crossAxisSpacing: 1.h),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        itemBuilder: (context, index) {
          return AttributeItemWidget();
        });
  }

  /// Section Widget
  Widget _buildEditInfo(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 7.v),
              child: Text("24.99", style: theme.textTheme.headlineSmall)),
          CustomElevatedButton(
              width: 166.h,
              text: "Edit Info",
              buttonStyle: CustomButtonStyles.fillPrimary,
              onPressed: () {
                onTapEditInfo(context);
              })
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the carManagementScreen when the action is triggered.
  onTapEditInfo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.carManagementScreen);
  }
}
