import 'package:vivu/screen/list_car_container_screen.dart';
import '../widgets/carlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/screen/list_car_page.dart';
import 'package:vivu/screen/recent_history_page.dart';
import 'package:vivu/widgets/custom_bottom_bar.dart';
import 'package:vivu/controllers/car_controller.dart';
import 'package:vivu/models/car_model.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key})
      : super(
          key: key,
        );

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  CarController _carController = CarController();
  @override
  Widget build(BuildContext context) {
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
    List<Car> carlist = _carController.cars;
    return SizedBox(
      height: 406.v,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 1.h,
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return CarlistItemWidget(car: carlist[index]);
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
            "Hot deals",
            style: CustomTextStyles.titleLargeErrorContainer,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes
                  .listCarContainerScreen); // Adjust with your actual sign-up route
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "View",
                    style: CustomTextStyles.titleLargePrimaryMedium,
                  ),
                  TextSpan(
                    text: " ",
                  ),
                  TextSpan(
                    text: "all",
                    style: CustomTextStyles.titleLargePrimaryMedium,
                  ),
                  TextSpan(
                    text: "...",
                    style: CustomTextStyles.titleLargePrimaryMedium,
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
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
                  "Q7",
                  style: CustomTextStyles.titleSmallErrorContainerBold15,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 1.h),
                child: Text(
                  "AUDI",
                  style: CustomTextStyles.titleSmallErrorContainerBold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "14.99",
                style: CustomTextStyles.titleSmallErrorContainer,
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

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Dashiconsscreenoptions:
        return AppRoutes.listCarContainerScreen;
      case BottomBarEnum.Claritynotificationsolid:
        return AppRoutes.recentHistoryPage;
      // case BottomBarEnum.Carbonlocationfilled:
      //   return "/";
      case BottomBarEnum.Cisettingsfilled:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.listCarContainerScreen:
        return ListCarContainerScreen();
      case AppRoutes.recentHistoryPage:
        return RecentHistoryPage();
      default:
        return DefaultWidget();
    }
  }
}
