import '../widgets/cargallery_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:vivu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';

class EditListCarScreen extends StatelessWidget {
  const EditListCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: ListView.separated(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 1.v);
                },
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CargalleryItemWidget(onTapView: () {
                    onTapView(context);
                  });
                }),
            bottomNavigationBar: _buildAddNewCar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarSubtitleOne(
            text: "Brands", margin: EdgeInsets.only(left: 30.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFaSolidEdit,
              margin: EdgeInsets.fromLTRB(26.h, 9.v, 26.h, 16.v))
        ]);
  }

  /// Section Widget
  Widget _buildAddNewCar(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 35.h, right: 25.h, bottom: 42.v),
        decoration: AppDecoration.outlineErrorContainer1,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
              child: CustomElevatedButton(
                  text: "Add new car",
                  margin: EdgeInsets.only(right: 18.h),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onPressed: () {
                    onTapAddNewCar(context);
                  })),
          Expanded(
              child: CustomElevatedButton(
                  text: "Confirm",
                  margin: EdgeInsets.only(left: 18.h),
                  buttonStyle: CustomButtonStyles.fillPrimary,
                  onPressed: () {
                    onTapConfirm(context);
                  }))
        ]));
  }

  /// Navigates to the bookingScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.bookingScreen);
  }

  /// Navigates to the setDateScreen when the action is triggered.
  onTapAddNewCar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setDateScreen);
  }

  /// Navigates to the editCarInfoScreen when the action is triggered.
  onTapConfirm(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editCarInfoScreen);
  }
}
