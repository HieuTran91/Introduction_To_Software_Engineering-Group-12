import '../widgets/moneyincomponent_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:vivu/core/app_export.dart';
import 'package:vivu/screen/list_car_page.dart';
import 'package:vivu/screen/recent_history_page.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:vivu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class CarRentalStatisticsScreen extends StatelessWidget {
  CarRentalStatisticsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 38.h, vertical: 44.v),
                child: Column(children: [
                  _buildMoneyInComponent(context),
                  SizedBox(height: 81.v),
                  _buildMonthlySpending(context),
                  SizedBox(height: 5.v)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 49.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftErrorcontainer,
            margin: EdgeInsets.only(left: 39.h, top: 18.v, bottom: 17.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarSubtitleOne(text: "Car Rental Statistics"),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgUser,
              margin: EdgeInsets.fromLTRB(34.h, 13.v, 34.h, 12.v))
        ]);
  }

  /// Section Widget
  Widget _buildMoneyInComponent(BuildContext context) {
    return SizedBox(
        height: 79.v,
        child: ListView.separated(
            padding: EdgeInsets.only(left: 10.h, right: 15.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return SizedBox(width: 15.h);
            },
            itemCount: 2,
            itemBuilder: (context, index) {
              return MoneyincomponentItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildMonthlySpending(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 2.h),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: fs.Svg(ImageConstant.imgMonthlySpending),
                fit: BoxFit.cover)),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 18.v),
            decoration: AppDecoration.outlineOnPrimaryContainer
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder14),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 5.h),
                      child: Text("Income",
                          style: CustomTextStyles
                              .bodyMediumRubikPrimaryContainer)),
                  SizedBox(height: 23.v),
                  Column(children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("600", style: theme.textTheme.bodySmall),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(top: 9.v, bottom: 4.v),
                              child: Divider(indent: 6.h)))
                    ]),
                    SizedBox(height: 13.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.only(top: 12.v, bottom: 18.v),
                          child: Column(children: [
                            Text("500", style: theme.textTheme.bodySmall),
                            SizedBox(height: 25.v),
                            Text("400", style: theme.textTheme.bodySmall),
                            SizedBox(height: 25.v),
                            Text("300", style: theme.textTheme.bodySmall),
                            SizedBox(height: 25.v),
                            Text("200", style: theme.textTheme.bodySmall),
                            SizedBox(height: 25.v),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Text("100",
                                    style: theme.textTheme.bodySmall)),
                            SizedBox(height: 25.v),
                            Align(
                                alignment: Alignment.centerRight,
                                child:
                                    Text("0", style: theme.textTheme.bodySmall))
                          ])),
                      Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(left: 6.h),
                              child: Column(children: [
                                SizedBox(
                                    height: 223.v,
                                    width: 287.h,
                                    child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  width: 252.h,
                                                  margin: EdgeInsets.only(
                                                      left: 16.h, right: 19.h),
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Container(
                                                            height: 149.v,
                                                            width: 17.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 73.v),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .errorContainer
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              0))
                                                                ])),
                                                        Container(
                                                            height: 199.v,
                                                            width: 17.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 24.v),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .errorContainer
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              0))
                                                                ])),
                                                        Container(
                                                            height: 107.v,
                                                            width: 17.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 116.v),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .errorContainer
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              0))
                                                                ])),
                                                        Container(
                                                            height: 123.v,
                                                            width: 17.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 100.v),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .errorContainer
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              0))
                                                                ])),
                                                        Container(
                                                            height: 223.v,
                                                            width: 17.h,
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .errorContainer
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              0))
                                                                ])),
                                                        Container(
                                                            height: 123.v,
                                                            width: 17.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 100.v),
                                                            decoration:
                                                                BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .primary,
                                                                    boxShadow: [
                                                                  BoxShadow(
                                                                      color: theme
                                                                          .colorScheme
                                                                          .errorContainer
                                                                          .withOpacity(
                                                                              0.25),
                                                                      spreadRadius:
                                                                          2.h,
                                                                      blurRadius:
                                                                          2.h,
                                                                      offset:
                                                                          Offset(
                                                                              4,
                                                                              0))
                                                                ]))
                                                      ]))),
                                          Align(
                                              alignment: Alignment.topCenter,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 21.v),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Divider(),
                                                        SizedBox(height: 39.v),
                                                        Divider(),
                                                        SizedBox(height: 39.v),
                                                        Divider(),
                                                        SizedBox(height: 39.v),
                                                        Divider(),
                                                        SizedBox(height: 39.v),
                                                        Divider()
                                                      ])))
                                        ])),
                                SizedBox(height: 1.v),
                                Divider(
                                    color: theme.colorScheme.errorContainer
                                        .withOpacity(1)),
                                SizedBox(height: 7.v),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 11.h, right: 16.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text("JAN",
                                              style: theme.textTheme.bodySmall),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 26.h),
                                              child: Text("FEB",
                                                  style: theme
                                                      .textTheme.bodySmall)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 25.h),
                                              child: Text("MAR",
                                                  style: theme
                                                      .textTheme.bodySmall)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 20.h),
                                              child: Text("APR",
                                                  style: theme
                                                      .textTheme.bodySmall)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 21.h),
                                              child: Text("MAY",
                                                  style: theme
                                                      .textTheme.bodySmall)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 23.h),
                                              child: Text("JUN",
                                                  style: theme
                                                      .textTheme.bodySmall))
                                        ]))
                              ])))
                    ])
                  ]),
                  SizedBox(height: 14.v)
                ])));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Dashiconsscreenoptions:
        return AppRoutes.listCarPage;
      case BottomBarEnum.Claritynotificationsolid:
        return AppRoutes.recentHistoryPage;
      case BottomBarEnum.Carbonlocationfilled:
        return "/";
      case BottomBarEnum.Cisettingsfilled:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.listCarPage:
        return ListCarPage();
      case AppRoutes.recentHistoryPage:
        return RecentHistoryPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
