import 'package:flutter/material.dart';
import 'dart:ui';

class HomeModel {
  List<ListItemModel> itemList = [ListItemModel(textProps: "Brands")];
}

class ListItemModel {
  ListItemModel({
    this.textProps,
    this.id,
  }) {
    textProps = textProps ?? "Brands";
    id = id ?? "";
  }

  String? textProps;

  String? id;
}

class ListItemWidget extends StatelessWidget {
  ListItemWidget(
    this.listItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );
  TextEditingController searchViewPropsController = TextEditingController();
  ListItemModel listItemModelObj;

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
              hintText: "lbl_search".tr,
            ),
          ),
          SizedBox(height: 92.v),
          Padding(
            padding: EdgeInsets.only(left: 1.h),
            child: Text(
              ListItemModel.textProps!,
              style: theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
