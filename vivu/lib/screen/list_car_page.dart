import '../widgets/cardetails_item_widget.dart';
import '../widgets/carlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:vivu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
import 'package:vivu/controllers/car_controller.dart';
import 'package:vivu/models/car_model.dart';

class ListCarPage extends StatefulWidget {
  @override
  _ListCarPageState createState() => _ListCarPageState();
}

class _ListCarPageState extends State<ListCarPage> {
  final CarController _carController = CarController();
  List<Car> brandCars = [];

  @override
  void initState() {
    super.initState();
    _fetchListCar();
  }

  Future<void> _fetchListCar() async {
    try {
      await _carController.fetchListCar();
    } catch (e) {
      // Handle error when fetching the list of cars
      // You can display an error message or retry mechanism
      print('Error fetching cars: $e');
    }
    if (mounted) {
      setState(() {}); // Update the UI after fetching the list of cars
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('List of Cars'),
      actions: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            // Add functionality for edit action if needed
          },
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
  if (_carController.cars.isEmpty) {
    return Center(
      child: Text('No cars available.'),
    );
  } else {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCarList(context),
          SizedBox(height: 8.0),
          _buildCarDetails(context),
          SizedBox(height: 24.0),
          // _buildEleven(context),
        ],
      ),
    );
  }
}

Widget _buildCarList(BuildContext context) {
  Set<String> uniqueBrands = _carController.cars.map((car) => car.carCompany).toSet();
  return SizedBox(
    height: 80.0,
    child: ListView.builder(
      padding: EdgeInsets.only(left: 20.0),
      scrollDirection: Axis.horizontal,
      itemCount: uniqueBrands.length,
      itemBuilder: (context, index) {
        String brand = uniqueBrands.elementAt(index);

        return CarListItemWidget(
          brand: brand,
          // car: _carController.cars[index],
          onTap: () {
            _filterCarsByBrand(brand);
            },
          );
        },
      ),
    );
  }

  Widget _buildCarDetails(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.0);
          },
          itemCount: brandCars.length,
          itemBuilder: (context, index) {
            return CarDetailsItemWidget(
              car: brandCars[index],
              onTapCarDetails: () {
                onTapCarDetails(context, brandCars[index]);
              },
            );
          },
        ),
      ),
    );
  }

  void onTapCarDetails(BuildContext context, Car car) {
    Navigator.pushNamed(context, AppRoutes.bookingScreen);
  }

  void _filterCarsByBrand(String brand) {
    brandCars = _carController.cars
        .where((car) => car.carCompany == brand)
        .toList();
    setState(() {});
  }
}

class CarListItemWidget extends StatelessWidget {
  String brand;
  final VoidCallback onTap;

  CarListItemWidget({required this.brand,required this.onTap});

  String _getImagePathForBrand(String brand) {
    switch (brand.toLowerCase()) {
      // case 'baic':
      //   return ImageConstant.;
      // case 'vinfast':
      //   return ImageConstant.;
      // case 'ford':
      //   return ImageConstant.;
      // case 'mazda':
      //   return ImageConstant.;
      case 'bmw':
        return ImageConstant.img398BmwRemovebgPreview; // Replace with the actual image path for BMW
      case 'mercedes':
        return ImageConstant.imgBenzRemovebgPreview; // Replace with the actual image path for Mercedes
      // Add cases for other brands as needed
      default:
        return ImageConstant.imgLamboRemovebgPreview; // Replace with a default image path
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 90.0,
        width: 80.0,
        padding: EdgeInsets.all(15.0),
        decoration: AppDecoration.outlineErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: CustomImageView(
          imagePath: _getImagePathForBrand(brand),
          height: 50.0,
          width: 50.0,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class CarDetailsItemWidget extends StatelessWidget {
  final Car car;
  final VoidCallback onTapCarDetails;

  CarDetailsItemWidget({required this.car, required this.onTapCarDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCarDetails,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        color: Colors.grey[100],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 200.0,
          width: 368.0,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[100],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  "14.99",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgImagesRemovebgPreview, // Replace with the correct image path
                height: 100.0,
                width: 220.0,
                alignment: Alignment.center,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        car.carCompany,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3.0),
                      Text(
                        car.model,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//   final Car car;
//   final VoidCallback onTapCarDetails;

//   CarDetailsItemWidget({required this.car, required this.onTapCarDetails});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTapCarDetails,
//       child: Container(
//         // Your car details item widget UI here
//       ),
//     );
//   }
// }


// Add your CustomImageView and other widgets used in the page




// class ListCarPage extends StatefulWidget {
//   @override
//   _ListCarPageState createState() => _ListCarPageState();
// }

// class _ListCarPageState extends State<ListCarPage> {
//   final CarController _carController = CarController();

//   @override
//   void initState() {
//     super.initState();
//     _fetchListCar();
//   }

//   Future<void> _fetchListCar() async {
//     bool success = await _carController.fetchListCar();
//     if (!success) {
//       // Handle error when fetching the list of cars
//       // You can display an error message or retry mechanism
//     }
//     if (mounted) {
//       setState(() {}); // Update the UI after fetching the list of cars
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             appBar: _buildAppBar(context),
//             body: SizedBox(
//                 width: SizeUtils.width,
//                 child: SingleChildScrollView(
//                     child: Padding(
//                         padding: EdgeInsets.only(bottom: 9.v),
//                         child: Column(children: [
//                           Column(children: [
//                             _buildCarList(context),
//                             SizedBox(height: 8.v),
//                             SizedBox(
//                                 height: 693.v,
//                                 width: 426.h,
//                                 child: Stack(
//                                     alignment: Alignment.topCenter,
//                                     children: [
//                                       _buildCarDetails(context),
//                                       CustomImageView(
//                                           imagePath:
//                                               ImageConstant.imgBmw320i1269x426,
//                                           height: 269.v,
//                                           width: 426.h,
//                                           alignment: Alignment.topCenter)
//                                     ]))
//                           ]),
//                           SizedBox(height: 24.v),
//                           _buildEleven(context)
//                         ]))))));
//   }

//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//         title: AppbarSubtitleOne(
//             text: "Brands", margin: EdgeInsets.only(left: 30.h)),
//         actions: [
//           AppbarTrailingImage(
//               imagePath: ImageConstant.imgFaSolidEditGray400,
//               margin: EdgeInsets.fromLTRB(26.h, 9.v, 26.h, 16.v))
//         ]);
//   }

//   Widget _buildCarList(BuildContext context) {
//   return FutureBuilder(
//     future: ,
//     builder: (context, snapshot) {
//       if (snapshot.connectionState == ConnectionState.waiting) {
//         return CircularProgressIndicator(); // or a loading indicator
//       } else if (snapshot.hasError) {
//         return Text('Error: ${snapshot.error}');
//       } else {
//         return Align(
//           alignment: Alignment.centerRight,
//           child: SizedBox(
//             height: 80.v,
//             child: ListView.separated(
//               padding: EdgeInsets.only(left: 30.h),
//               scrollDirection: Axis.horizontal,
//               separatorBuilder: (context, index) {
//                 return SizedBox(width: 10.h);
//               },
//               itemCount: _carController.cars.length,
//               itemBuilder: (context, index) {
//                 return CarlistItemWidget(
//                   car: _carController.cars[index],
//                 );
//               },
//             ),
//           ),
//         );
//       }
//     },
//   );
// }
//   /// Section Widget
//   // Widget _buildCarDetails(BuildContext context) {
//   //   return Align(
//   //       alignment: Alignment.bottomCenter,
//   //       child: Padding(
//   //           padding: EdgeInsets.only(left: 29.h, top: 45.v, right: 29.h),
//   //           child: ListView.separated(
//   //               physics: NeverScrollableScrollPhysics(),
//   //               shrinkWrap: true,
//   //               separatorBuilder: (context, index) {
//   //                 return SizedBox(height: 24.v);
//   //               },
//   //               itemCount: 3,
//   //               itemBuilder: (context, index) {
//   //                 return CardetailsItemWidget(onTapCarDetails: () {
//   //                   onTapCarDetails(context);
//   //                 });
//   //               })));
//   // }
//   Widget _buildCarDetails(BuildContext context) {
//   return Align(
//     alignment: Alignment.bottomCenter,
//     child: Padding(
//       padding: EdgeInsets.only(left: 29.h, top: 45.v, right: 29.h),
//       child: ListView.separated(
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         separatorBuilder: (context, index) {
//           return SizedBox(height: 24.v);
//         },
//         itemCount: _carController.cars.length,
//         itemBuilder: (context, index) {
//           return CardetailsItemWidget(
//             car:_carController.cars[index],
//             onTapCarDetails: () {
//               onTapCarDetails(context, _carController.cars[index]);
//             },
//           );
//         },
//       ),
//     ),
//   );
// }

//   /// Section Widget
//   Widget _buildEleven(BuildContext context) {
//     return Card(
//         clipBehavior: Clip.antiAlias,
//         elevation: 0,
//         color: appTheme.gray100,
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadiusStyle.roundedBorder10),
//         child: Container(
//             height: 200.v,
//             width: 368.h,
//             padding: EdgeInsets.symmetric(horizontal: 9.h, vertical: 18.v),
//             decoration: AppDecoration.fillGray
//                 .copyWith(borderRadius: BorderRadiusStyle.roundedBorder10),
//             child: Stack(alignment: Alignment.center, children: [
//               Align(
//                   alignment: Alignment.topRight,
//                   child: Text("14.99",
//                       style: CustomTextStyles.titleSmallErrorContainer)),
//               CustomImageView(
//                   imagePath: ImageConstant.imgImagesRemovebgPreview,
//                   height: 134.v,
//                   width: 280.h,
//                   alignment: Alignment.center),
//               Align(
//                   alignment: Alignment.topLeft,
//                   child: Padding(
//                       padding: EdgeInsets.only(left: 1.h),
//                       child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("BMW",
//                                 style: CustomTextStyles
//                                     .titleSmallErrorContainerBold),
//                             SizedBox(height: 3.v),
//                             Text("M3",
//                                 style: CustomTextStyles
//                                     .titleSmallErrorContainerBold15)
//                           ])))
//             ])));
//   }

  /// Navigates to the bookingScreen when the action is triggered.
//   onTapCarDetails(BuildContext context, Car car) {
//     Navigator.pushNamed(context, AppRoutes.bookingScreen);
//   }
// }
