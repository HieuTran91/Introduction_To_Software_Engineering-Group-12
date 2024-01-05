import '../widgets/amgcomponent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:vivu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';

class RecentHistoryPage extends StatelessWidget {
  const RecentHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 39.h, top: 27.v, right: 26.h),
                child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 15.v);
                    },
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return AmgcomponentItemWidget();
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftErrorcontainer,
            margin: EdgeInsets.only(left: 39.h, top: 17.v, bottom: 18.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Recent History"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgThumbsUp,
              margin: EdgeInsets.fromLTRB(34.h, 12.v, 34.h, 13.v))
        ]);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
