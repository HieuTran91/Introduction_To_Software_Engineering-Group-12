import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgDashiconsScreenoptions,
      activeIcon: ImageConstant.imgDashiconsScreenoptions,
      type: BottomBarEnum.Dashiconsscreenoptions,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgClarityNotificationSolid,
      activeIcon: ImageConstant.imgClarityNotificationSolid,
      type: BottomBarEnum.Claritynotificationsolid,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCarbonLocationFilled,
      activeIcon: ImageConstant.imgCarbonLocationFilled,
      type: BottomBarEnum.Carbonlocationfilled,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgCiSettingsFilled,
      activeIcon: ImageConstant.imgCiSettingsFilled,
      type: BottomBarEnum.Cisettingsfilled,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 99.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.errorContainer.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: CustomImageView(
              imagePath: bottomMenuList[index].icon,
              height: 30.adaptSize,
              width: 30.adaptSize,
              color: theme.colorScheme.errorContainer.withOpacity(1),
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 30.adaptSize,
              width: 30.adaptSize,
              color: theme.colorScheme.primary,
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Dashiconsscreenoptions,
  Claritynotificationsolid,
  Carbonlocationfilled,
  Cisettingsfilled,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required this.type,
  });

  String icon;

  String activeIcon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
