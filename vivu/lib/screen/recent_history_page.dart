import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/app_bar/appbar_leading_image.dart';
import 'package:vivu/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:vivu/widgets/app_bar/appbar_trailing_image.dart';
import 'package:vivu/widgets/app_bar/custom_app_bar.dart';
// import 'package:vivu/controllers/account_controller.dart';
import 'package:vivu/controllers/rental_controller.dart';
import 'package:vivu/models/rental_model.dart';
import 'package:vivu/controllers/account_controller.dart';


class RecentHistoryPage extends StatefulWidget {
  const RecentHistoryPage({Key? key}) : super(key: key);

  @override
  _RecentHistoryPageState createState() => _RecentHistoryPageState();
}

class _RecentHistoryPageState extends State<RecentHistoryPage> {
  late Future<bool> rentalHistoryFuture;
  final RentalController _rentalController = RentalController();
  @override
  void initState() {
    super.initState();
    rentalHistoryFuture = _fetchRentalHistory();
  }

  Future<bool> _fetchRentalHistory() async {
    final accountSingleton = AccountSingleton();
    try {
      await _rentalController.fetchRentalHistory(accountSingleton.myAccountFromMap.accountID);
      return true;
    } catch (e) {
      print('Error fetching rental history: $e');
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Padding(
          padding: EdgeInsets.only(left: 39.h, top: 27.v, right: 26.h),
          child: FutureBuilder<bool>(
            future: rentalHistoryFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Loading indicator while waiting for the data
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError || !snapshot.data!) {
                // Display an error message if there's an error or fetching failed
                return Center(child: Text('Error fetching rental history'));
              } else {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _rentalController.rentalHistory.length,
                  itemBuilder: (context, index) {
                    // Extract the rental information
                    Rental rental = _rentalController.rentalHistory[index];

                    // Display the rental information using ComponentItemWidget
                    return ComponentItemWidget1(
                      rentalID: rental.rentalID,
                      carID: rental.carID,
                      customerID: rental.customerID,
                      returnTime: rental.returnTime,
                      pickupTime: rental.pickupTime,
                      rentalStatus: rental.rentalStatus,
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 49.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgArrowLeftErrorcontainer,
        margin: EdgeInsets.only(left: 39.h, top: 17.v, bottom: 18.v),
        onTap: () {
          onTapArrowLeft(context);
        },
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(text: "Recent History"),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgThumbsUp,
          margin: EdgeInsets.fromLTRB(34.h, 12.v, 34.h, 13.v),
        ),
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}

class ComponentItemWidget1 extends StatelessWidget {
  final String rentalID;
  final String carID;
  final String customerID;
  final String returnTime;
  final String pickupTime;
  final int rentalStatus;

  ComponentItemWidget1({
    required this.rentalID,
    required this.carID,
    required this.customerID,
    required this.returnTime,
    required this.pickupTime,
    required this.rentalStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rental ID: $rentalID'),
            Text('Car ID: $carID'),
            Text('Customer ID: $customerID'),
            Text('Return Time: $returnTime'),
            Text('Pickup Time: $pickupTime'),
            Text('Rental Status: $rentalStatus'),
          ],
        ),
      ),
    );
  }
}