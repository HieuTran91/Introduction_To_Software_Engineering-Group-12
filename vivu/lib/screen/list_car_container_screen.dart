import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/screen/list_car_page.dart';
import 'package:vivu/screen/recent_history_page.dart';
import 'package:vivu/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class ListCarContainerScreen extends StatelessWidget {
  ListCarContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Navigator(
                key: navigatorKey,
                initialRoute: AppRoutes.listCarPage,
                onGenerateRoute: (routeSetting) => PageRouteBuilder(
                    pageBuilder: (ctx, ani, ani1) =>
                        getCurrentPage(routeSetting.name!),
                    transitionDuration: Duration(seconds: 0))),
            bottomNavigationBar: _buildBottomBar(context)));
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
}
