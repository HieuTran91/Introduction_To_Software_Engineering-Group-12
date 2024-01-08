import '../widgets/cardetails_item_widget.dart';
import '../widgets/carlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:vivu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/controllers/car_controller.dart';
import 'package:vivu/models/car_model.dart';

class ListCarPage extends StatelessWidget {
  // const ListCarPage({Key? key}) : super(key: key);
  CarController _carController = CarController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 9.v),
                        child: Column(children: [
                          Column(children: [
                            _buildCarList(context),
                            SizedBox(height: 8.v),
                            SizedBox(
                                height: 693.v,
                                width: 426.h,
                                child: Stack(
                                    alignment: Alignment.topCenter,
                                    children: [
                                      _buildCarDetails(context),
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgBmw320i1269x426,
                                          height: 269.v,
                                          width: 426.h,
                                          alignment: Alignment.topCenter)
                                    ]))
                          ]),
                          SizedBox(height: 24.v),
                          _buildEleven(context)
                        ]))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarSubtitleOne(
            text: "Brands", margin: EdgeInsets.only(left: 30.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFaSolidEditGray400,
              margin: EdgeInsets.fromLTRB(26.h, 9.v, 26.h, 16.v))
        ]);
  }

  /// Section Widget
  // Widget _buildCarList(BuildContext context) {
  //   return Align(
  //       alignment: Alignment.centerRight,
  //       child: SizedBox(
  //           height: 80.v,
  //           child: ListView.separated(
  //               padding: EdgeInsets.only(left: 30.h),
  //               scrollDirection: Axis.horizontal,
  //               separatorBuilder: (context, index) {
  //                 return SizedBox(width: 10.h);
  //               },
  //               itemCount: 5,
  //               itemBuilder: (context, index) {
  //                 return CarlistItemWidget();
  //               })));
  // }
  Widget _buildCarList(BuildContext context) {
  return FutureBuilder(
    future: _carController.fetchListCar(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(); // or a loading indicator
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            height: 80.v,
            child: ListView.separated(
              padding: EdgeInsets.only(left: 30.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return SizedBox(width: 10.h);
              },
              itemCount: _carController.cars.length,
              itemBuilder: (context, index) {
                return CarlistItemWidget(
                  car: _carController.cars[index],
                );
              },
            ),
          ),
        );
      }
    },
  );
}
  /// Section Widget
  // Widget _buildCarDetails(BuildContext context) {
  //   return Align(
  //       alignment: Alignment.bottomCenter,
  //       child: Padding(
  //           padding: EdgeInsets.only(left: 29.h, top: 45.v, right: 29.h),
  //           child: ListView.separated(
  //               physics: NeverScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               separatorBuilder: (context, index) {
  //                 return SizedBox(height: 24.v);
  //               },
  //               itemCount: 3,
  //               itemBuilder: (context, index) {
  //                 return CardetailsItemWidget(onTapCarDetails: () {
  //                   onTapCarDetails(context);
  //                 });
  //               })));
  // }
  Widget _buildCarDetails(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(left: 29.h, top: 45.v, right: 29.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 24.v);
        },
        itemCount: _carController.cars.length,
        itemBuilder: (context, index) {
          return CardetailsItemWidget(
            car:_carController.cars[index],
            onTapCarDetails: () {
              onTapCarDetails(context, _carController.cars[index]);
            },
          );
        },
      ),
    ),
  );
}

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: appTheme.gray100,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder10),
        child: Container(
            height: 200.v,
            width: 368.h,
            padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 18.v),
            decoration: AppDecoration.fillGray
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
            child: Stack(alignment: Alignment.center, children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Text("14.99",
                      style: CustomTextStyles.titleSmallErrorContainer)),
              CustomImageView(
                  imagePath: ImageConstant.imgImagesRemovebgPreview,
                  height: 134.v,
                  width: 280.h,
                  alignment: Alignment.center),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.only(left: 1.h),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("BMW",
                                style: CustomTextStyles
                                    .titleSmallErrorContainerBold),
                            SizedBox(height: 3.v),
                            Text("M3",
                                style: CustomTextStyles
                                    .titleSmallErrorContainerBold15)
                          ])))
            ])));
  }

  /// Navigates to the bookingScreen when the action is triggered.
  onTapCarDetails(BuildContext context, Car car) {
    Navigator.pushNamed(context, AppRoutes.bookingScreen);
  }
}
