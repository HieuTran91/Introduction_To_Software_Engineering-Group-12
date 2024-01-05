import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';

// ignore: must_be_immutable
class CargalleryItemWidget extends StatelessWidget {
  CargalleryItemWidget({
    Key? key,
    this.onTapView,
  }) : super(
          key: key,
        );

  VoidCallback? onTapView;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 269.v,
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 90.v),
            decoration: AppDecoration.fillOnPrimaryContainer,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgBmw320i1,
                  height: 269.v,
                  width: 214.h,
                  alignment: Alignment.centerLeft,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.symmetric(vertical: 25.v),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 39.v,
                            bottom: 162.v,
                          ),
                          child: Text(
                            "BMW",
                            style:
                                CustomTextStyles.titleSmallErrorContainerBold,
                          ),
                        ),
                        Spacer(
                          flex: 53,
                        ),
                        Container(
                          height: 200.v,
                          width: 186.h,
                          margin: EdgeInsets.only(top: 19.v),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    onTapView!.call();
                                  },
                                  child: Container(
                                    height: 200.v,
                                    width: 186.h,
                                    decoration: BoxDecoration(
                                      color: appTheme.gray100,
                                      borderRadius: BorderRadius.circular(
                                        10.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 18.v,
                                    right: 9.h,
                                  ),
                                  child: Text(
                                    "14.99",
                                    style: CustomTextStyles
                                        .titleSmallErrorContainer,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(
                          flex: 46,
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 3.v),
                          padding: EdgeInsets.symmetric(
                            horizontal: 27.h,
                            vertical: 92.v,
                          ),
                          decoration: AppDecoration.fillRedA,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 4.v),
                              Text(
                                "Delete",
                                style:
                                    CustomTextStyles.headlineSmallArchivoBlack,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 80.adaptSize,
            width: 80.adaptSize,
            margin: EdgeInsets.only(bottom: 279.v),
            padding: EdgeInsets.all(15.h),
            decoration: AppDecoration.outlineErrorContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgLamboRemovebgPreview,
              height: 50.adaptSize,
              width: 50.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 80.adaptSize,
            width: 80.adaptSize,
            margin: EdgeInsets.only(
              left: 10.h,
              bottom: 279.v,
            ),
            padding: EdgeInsets.all(15.h),
            decoration: AppDecoration.outlineErrorContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgBenzRemovebgPreview,
              height: 50.adaptSize,
              width: 50.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 80.adaptSize,
            width: 80.adaptSize,
            margin: EdgeInsets.only(
              left: 10.h,
              bottom: 279.v,
            ),
            padding: EdgeInsets.all(15.h),
            decoration: AppDecoration.outlineErrorContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgPorsheRemovebgPreview,
              height: 50.adaptSize,
              width: 50.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 80.adaptSize,
            width: 80.adaptSize,
            margin: EdgeInsets.only(
              left: 10.h,
              bottom: 279.v,
            ),
            padding: EdgeInsets.all(10.h),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.img398BmwRemovebgPreview,
              height: 50.adaptSize,
              width: 50.adaptSize,
              alignment: Alignment.center,
            ),
          ),
          Container(
            height: 80.adaptSize,
            width: 80.adaptSize,
            margin: EdgeInsets.only(
              left: 10.h,
              bottom: 279.v,
            ),
            padding: EdgeInsets.all(15.h),
            decoration: AppDecoration.outlineErrorContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder10,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgFerrariLogo2,
              height: 50.adaptSize,
              width: 50.adaptSize,
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
