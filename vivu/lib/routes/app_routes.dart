import 'package:flutter/material.dart';
import 'package:vivu/screen/launch_screen.dart';
import 'package:vivu/screen/edit_list_car_screen.dart';
import 'package:vivu/screen/edit_car_info_screen.dart';
import 'package:vivu/screen/co_car_management_screen.dart';
import 'package:vivu/screen/login_screen.dart';
import 'package:vivu/screen/sign_up_screen.dart';
import 'package:vivu/screen/verification_screen.dart';
import 'package:vivu/screen/c_home_screen.dart';
import 'package:vivu/screen/list_car_container_screen.dart';
import 'package:vivu/screen/c_booking_screen.dart';
import 'package:vivu/screen/c_set_date_screen.dart';
import 'package:vivu/screen/payment_one_screen.dart';
import 'package:vivu/screen/payment_2_master_card_screen.dart';
import 'package:vivu/screen/driver_details_two_screen.dart';
import 'package:vivu/screen/driver_details_screen.dart';
import 'package:vivu/screen/car_rental_statistics_screen.dart';
import 'package:vivu/screen/solid_edit_screen.dart';
import 'package:vivu/screen/payment_2_visa_card_screen.dart';
import 'package:vivu/screen/payment_2_paypal_screen.dart';
import 'package:vivu/screen/payment_2_america_express_screen.dart';
import 'package:vivu/screen/app_navigation_screen.dart';

class AppRoutes {
  static const String launchScreen = '/launch_screen';

  static const String editListCarScreen = '/edit_list_car_screen';

  static const String editCarInfoScreen = '/edit_car_info_screen';

  static const String carManagementScreen = '/co_car_management_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String verificationScreen = '/verification_screen';

  static const String homeScreen = '/c_home_screen';

  static const String listCarPage = '/list_car_page';

  static const String listCarContainerScreen = '/list_car_container_screen';

  static const String bookingScreen = '/c_booking_screen';

  static const String setDateScreen = '/set_date_screen';

  static const String paymentOneScreen = '/payment_one_screen';

  static const String payment2MasterCardScreen =
      '/payment_2_master_card_screen';

  static const String driverDetailsTwoScreen = '/driver_details_two_screen';

  static const String driverDetailsScreen = '/driver_details_screen';

  static const String recentHistoryPage = '/recent_history_page';

  static const String carRentalStatisticsScreen =
      '/car_rental_statistics_screen';

  static const String solidEditScreen = '/solid_edit_screen';

  static const String payment2VisaCardScreen = '/payment_2_visa_card_screen';

  static const String payment2PaypalScreen = '/payment_2_paypal_screen';

  static const String payment2AmericaExpressScreen =
      '/payment_2_america_express_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    launchScreen: (context) => LaunchScreen(),
    editListCarScreen: (context) => EditListCarScreen(),
    editCarInfoScreen: (context) => EditCarInfoScreen(),
    carManagementScreen: (context) => CarManagementScreen(),
    loginScreen: (context) => LoginScreen(),
    signUpScreen: (context) => SignUpScreen(),
    verificationScreen: (context) => VerificationScreen(),
    homeScreen: (context) => HomeScreen(),
    listCarContainerScreen: (context) => ListCarContainerScreen(),
    bookingScreen: (context) => BookingScreen(),
    setDateScreen: (context) => SetDateScreen(),
    paymentOneScreen: (context) => PaymentOneScreen(),
    payment2MasterCardScreen: (context) => Payment2MasterCardScreen(),
    driverDetailsTwoScreen: (context) => DriverDetailsTwoScreen(),
    driverDetailsScreen: (context) => DriverDetailsScreen(),
    carRentalStatisticsScreen: (context) => CarRentalStatisticsScreen(),
    solidEditScreen: (context) => SolidEditScreen(),
    payment2VisaCardScreen: (context) => Payment2VisaCardScreen(),
    payment2PaypalScreen: (context) => Payment2PaypalScreen(),
    payment2AmericaExpressScreen: (context) => Payment2AmericaExpressScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
