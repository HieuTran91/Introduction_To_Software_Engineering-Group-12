import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

final features = [
  {"title": "SEATS", "value": "4"},
  {"title": "FUEL TYPE", "value": "Petrol"},
  {"title": "ENGINE", "value": "1.5L"},
  {"title": "YEAR", "value": "2018"}
];

// ignore: must_be_immutable
class GridItemWidget extends StatefulWidget {
  @override
  State<GridItemWidget> createState() => _GridItemWidgetState();
}

class _GridItemWidgetState extends State<GridItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 128.v,
        width: 120.h,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.h,
                  vertical: 16.v,
                ),
                decoration: AppDecoration.outlineErrorContainer2.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder10,
                ),
              ),
            ),
            for (var i = 0; i < features.length; i++)
              _buildFeatureBox(features[i]),
            CustomImageView(
              imagePath: ImageConstant.imgFaSolidEditGray400,
              height: 24.adaptSize,
              width: 24.adaptSize,
              alignment: Alignment.topRight,
            ),
          ],
        ));
  }

  Widget _buildFeatureBox(Map feature) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 9.v),
        Text(
          feature['title'],
          style: theme.textTheme.titleSmall,
        ),
        SizedBox(height: 4.v),
        Text(
          feature['value'],
          style: CustomTextStyles.titleSmallOnPrimaryContainer,
        ),
        CustomImageView(
          imagePath: ImageConstant.imgFaSolidEditGray400,
          height: 24.adaptSize,
          width: 24.adaptSize,
          alignment: Alignment.topRight,
        ),
      ],
    );
  }
}
