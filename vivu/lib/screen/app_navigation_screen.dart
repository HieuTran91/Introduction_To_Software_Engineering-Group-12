import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: 375.h,
          child: Column(
            children: [
              _buildAppNavigation(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          context,
                          screenTitle: "launch",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.launchScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit List Car",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editListCarScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Edit Car Info",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.editCarInfoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Car Management",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.carManagementScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Welcome ",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Sign up",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Verification",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.verificationScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Home",
                          onTapScreenTitle: () =>
                              onTapScreenTitle(context, AppRoutes.homeScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "List Car - Container",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.listCarContainerScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Booking",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.bookingScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Set Date",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.setDateScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment One",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.paymentOneScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment 2/master card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.payment2MasterCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "driver details  Two",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.driverDetailsTwoScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "driver details",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.driverDetailsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Car Rental Statistics",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.carRentalStatisticsScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "fa-solid:edit",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.solidEditScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment 2/visa card",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.payment2VisaCardScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment 2/paypal",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.payment2PaypalScreen),
                        ),
                        _buildScreenTitle(
                          context,
                          screenTitle: "Payment 2/america express",
                          onTapScreenTitle: () => onTapScreenTitle(
                              context, AppRoutes.payment2AmericaExpressScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle(
    BuildContext context, {
    required String screenTitle,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  screenTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(
    BuildContext context,
    String routeName,
  ) {
    Navigator.pushNamed(context, routeName);
  }
}
