import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_title.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/widgets/custom_drop_down.dart';
import 'package:vivu/widgets/custom_elevated_button.dart';
import 'package:vivu/widgets/custom_switch.dart';

// ignore_for_file: must_be_immutable
class SetDateScreen extends StatelessWidget {
  SetDateScreen({Key? key}) : super(key: key);

  bool isSelectedSwitch = false;

  DateTime? rangeStart;

  DateTime? rangeEnd;

  DateTime? selectedDay;

  DateTime focusedDay = DateTime.now();

  RangeSelectionMode rangeSelectionMode = RangeSelectionMode.toggledOn;

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 18.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.v),
                      _buildBookingSection(context),
                      SizedBox(height: 29.v),
                      _buildCalendarSection(context),
                      SizedBox(height: 34.v),
                      Padding(
                          padding: EdgeInsets.only(right: 68.h),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(bottom: 2.v),
                                    child: Text("Pick-up time",
                                        style: CustomTextStyles
                                            .titleMediumInterErrorContainer)),
                                Padding(
                                    padding: EdgeInsets.only(top: 2.v),
                                    child: Text("Return time",
                                        style: CustomTextStyles
                                            .titleMediumInterErrorContainer))
                              ])),
                      SizedBox(height: 12.v),
                      _buildTimeSection(context),
                      SizedBox(height: 61.v),
                      CustomElevatedButton(
                          text: "Booking",
                          margin: EdgeInsets.symmetric(horizontal: 53.h),
                          buttonTextStyle: CustomTextStyles.headlineSmallInter,
                          onPressed: () {
                            onTapBooking(context);
                          },
                          alignment: Alignment.center),
                      SizedBox(height: 21.v),
                      Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                              width: 131.h,
                              child: Divider(
                                  color: theme.colorScheme.errorContainer)))
                    ]))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 54.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftErrorcontainer32x32,
            margin: EdgeInsets.only(left: 22.h, top: 11.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "Date & Time"));
  }

  /// Section Widget
  Widget _buildBookingSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 12.v),
        decoration: AppDecoration.outlineErrorContainer3
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder22),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 6.h),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 3.v),
                            child: Text("Booking with driver",
                                style: CustomTextStyles
                                    .headlineSmallInterErrorContainer)),
                        CustomSwitch(
                            value: isSelectedSwitch,
                            onChange: (value) {
                              isSelectedSwitch = value;
                            })
                      ])),
              SizedBox(height: 3.v),
              Text("Don’t have a driver? book with the driver.",
                  style:
                      CustomTextStyles.titleMediumInterErrorContainerSemiBold)
            ]));
  }

  /// Section Widget
  Widget _buildCalendarSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 7.v),
        decoration: AppDecoration.outlineErrorContainer3,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(left: 2.h, right: 12.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomImageView(
                    imagePath: ImageConstant.imgArrowLeftErrorcontainer32x32,
                    height: 32.adaptSize,
                    width: 32.adaptSize),
                Spacer(flex: 46),
                Padding(
                    padding: EdgeInsets.only(top: 5.v, bottom: 4.v),
                    child: Text("July 2022",
                        style: CustomTextStyles.titleMediumLatoErrorContainer)),
                Spacer(flex: 53),
                CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 23.v,
                    width: 13.h,
                    margin: EdgeInsets.symmetric(vertical: 4.v))
              ])),
          SizedBox(height: 18.v),
          SizedBox(
              height: 264.v,
              width: 366.h,
              child: TableCalendar(
                  locale: 'en_US',
                  firstDay: DateTime(DateTime.now().year - 5),
                  lastDay: DateTime(DateTime.now().year + 5),
                  calendarFormat: CalendarFormat.month,
                  rangeSelectionMode: rangeSelectionMode,
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  calendarStyle: CalendarStyle(
                      outsideDaysVisible: false,
                      isTodayHighlighted: true,
                      todayTextStyle: TextStyle(
                          color: theme.colorScheme.onPrimaryContainer
                              .withOpacity(1),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w600),
                      todayDecoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(13.5.h))),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                          color:
                              theme.colorScheme.errorContainer.withOpacity(0.6),
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500)),
                  headerVisible: false,
                  rowHeight: 27.adaptSize,
                  focusedDay: focusedDay,
                  rangeStartDay: rangeStart,
                  rangeEndDay: rangeEnd,
                  onDaySelected: (selectedDay, focusedDay) {},
                  onRangeSelected: (start, end, focusedDay) {},
                  onPageChanged: (focusedDay) {})),
          SizedBox(height: 45.v)
        ]));
  }

  /// Section Widget
  Widget _buildTimeSection(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 17.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: CustomDropDown(
                  width: 150.h,
                  icon: Container(
                      margin: EdgeInsets.fromLTRB(30.h, 15.v, 20.h, 14.v),
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowdown,
                          height: 28.adaptSize,
                          width: 28.adaptSize)),
                  hintText: "10:00",
                  items: dropdownItemList,
                  onChanged: (value) {})),
          CustomDropDown(
              width: 150.h,
              icon: Container(
                  margin: EdgeInsets.fromLTRB(30.h, 15.v, 18.h, 14.v),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgArrowdown,
                      height: 28.adaptSize,
                      width: 28.adaptSize)),
              hintText: "17:00",
              items: dropdownItemList1,
              contentPadding:
                  EdgeInsets.only(left: 19.h, top: 18.v, bottom: 18.v),
              onChanged: (value) {})
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the driverDetailsScreen when the action is triggered.
  onTapBooking(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.driverDetailsScreen);
  }
}
