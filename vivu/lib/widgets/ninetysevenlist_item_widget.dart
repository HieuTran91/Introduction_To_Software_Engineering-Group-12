import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/custom_search_view.dart';

// ignore: must_be_immutable
class NinetysevenlistItemWidget extends StatelessWidget {
  NinetysevenlistItemWidget({Key? key})
      : super(
          key: key,
        );

  TextEditingController searchViewPropsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 41.v),
      padding: EdgeInsets.symmetric(
        horizontal: 29.h,
        vertical: 48.v,
      ),
      decoration: AppDecoration.fillErrorContainer,
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 86.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: CustomSearchView(
              controller: searchViewPropsController,
              hintText: "Search",
            ),
          ),
          SizedBox(height: 92.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              "Brands",
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
