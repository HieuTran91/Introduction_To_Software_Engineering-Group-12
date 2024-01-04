import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:vivu/lib/model/home_model.dart';
import 'package:vivu/lib/controller/home_controller.dart';
import 'package:vivu/lib/theme/border.dart';
import 'package:vivu/theme/button.dart';
import 'package:vivu/theme/theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController();
    controller.getHomeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildList(context),
              SizedBox(height: 90.v),
              _buildHotDealsRow(context),
              SizedBox(height: 10.v),
              _buildStack(context),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildList(BuildContext context) {
    return SizedBox(
      height: 406.v,
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 1.h,
              );
            },
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              ListItemModel model = itemList[index];
              return ListItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildHotDealsRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "lbl_hot_deals".tr,
            style: TextTheme(
                titleLarge), //CustomTextStyles.titleLargeErrorContainer,
          ),
          Text(
            "lbl_view_all".tr,
            style: TextTheme(titleLarge),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildStack(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      color: appTheme.gray100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Container(
        height: 233.v,
        width: 366.h,
        padding: EdgeInsets.symmetric(
          horizontal: 9.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.fillGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  top: 30.v,
                ),
                child: Text(
                  "lbl_q7".tr,
                  style: TextTheme(
                      titleSmall), //CustomTextStyles.titleSmallErrorContainerBold15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "lbl_audi".tr,
                  style: TextTheme(
                      titleSmall), //CustomTextStyles.titleSmallErrorContainerBold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "lbl_14_99".tr,
                style: TextTheme(
                    titleSmall), //CustomTextStyles.titleSmallErrorContainer,
              ),
            ),
            CustomImageView(
              imagePath: ImageConstant.imgQ7RemovebgPreview,
              height: 170.v,
              width: 303.h,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16.h),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
            navigatorKey.currentContext!, getCurrentRoute(type));
      },
    );
  }
}
