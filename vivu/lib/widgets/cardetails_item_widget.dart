import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/models/car_model.dart';
// ignore: must_be_immutable
class CardetailsItemWidget extends StatelessWidget {
  CardetailsItemWidget({
    Key? key,
    required this.onTapCarDetails,
    required this.car,
  }) : super(
          key: key,
        );

  VoidCallback? onTapCarDetails;
  final Car car;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          onTapCarDetails!.call();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 9.h,
            vertical: 18.v,
          ),
          decoration: AppDecoration.fillGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 1.h,
                  bottom: 114.v,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "BMW",
                        style: CustomTextStyles.titleSmallErrorContainerBold,
                      ),
                    ),
                    SizedBox(height: 2.v),
                    Text(
                      "320i",
                      style: CustomTextStyles.titleSmallErrorContainerBold15,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 140.v),
                child: Text(
                  "14.99",
                  style: CustomTextStyles.titleSmallErrorContainer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
