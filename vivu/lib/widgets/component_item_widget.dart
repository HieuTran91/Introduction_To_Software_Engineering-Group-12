import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

List<Widget> components = [
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "VinFast VF8 Eco",
        style: CustomTextStyles.titleMediumErrorContainer,
      ),
      SizedBox(height: 6),
      Text(
        "Oct 14, 2023",
        style: CustomTextStyles.titleSmallGray400,
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "BAIC Beijing",
        style: CustomTextStyles.titleMediumErrorContainer,
      ),
      SizedBox(height: 6.v),
      Text(
        "Dec 12,2020",
        style: CustomTextStyles.titleSmallGray400,
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Mazda CX5 Deluxe",
        style: CustomTextStyles.titleMediumErrorContainer,
      ),
      SizedBox(height: 6.v),
      Text(
        "Jan 23,2021",
        style: CustomTextStyles.titleSmallGray400,
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "BMW 320i",
        style: CustomTextStyles.titleMediumErrorContainer,
      ),
      SizedBox(height: 6.v),
      Text(
        "Jun 02,2019",
        style: CustomTextStyles.titleSmallGray400,
      ),
    ],
  ),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Ford Ranger XLS",
        style: CustomTextStyles.titleMediumErrorContainer,
      ),
      SizedBox(height: 6.v),
      Text(
        "Aug 30,2022",
        style: CustomTextStyles.titleSmallGray400,
      ),
    ],
  ),
];

// ignore: must_be_immutable
class ComponentItemWidget extends StatelessWidget {
  const ComponentItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 19.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.outlineGray4001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 220.h,
            margin: EdgeInsets.only(left: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                  padding: EdgeInsets.all(9.h),
                  decoration: AppDecoration.outlineGray4001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder10,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgBenzRemovebgPreview,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    alignment: Alignment.center,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 3.v),
                    // child: Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Mercedes  aMG",
                    //       style: CustomTextStyles.titleMediumErrorContainer,
                    //     ),
                    //     SizedBox(height: 6.v),
                    //     Text(
                    //       "Dec 14,2021",
                    //       style: CustomTextStyles.titleSmallGray400,
                    //     ),
                    //   ],
                    // ),
                    child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 15);
                      },
                      itemCount: components.length,
                      itemBuilder: (context, index) {
                        return components[index];
                      },
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 1.h),
                    child: Text(
                      "32",
                      style: CustomTextStyles.titleMediumErrorContainer,
                    ),
                  ),
                ),
                SizedBox(height: 5.v),
                Text(
                  "1 day",
                  style: CustomTextStyles.titleSmallGray400,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
