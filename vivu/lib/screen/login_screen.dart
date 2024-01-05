import 'package:flutter/material.dart';
import 'package:vivu/core/app_export.dart';
import 'package:vivu/widgets/custom_outlined_button.dart';
import 'package:vivu/widgets/custom_text_form_field.dart';
import 'package:vivu/controllers/account_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AccountController controller = AccountController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  Future<void> onSubmit(BuildContext context) async {
    if (await controller.validateAccount(
        phoneNumberController.text, passwordController.text)) {
      controller.login(context);
    } else {
      // show error
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid credentials")));
    }
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    SizedBox(
                      height: 763.v,
                      width: double.maxFinite,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          _buildTopLogo(context),
                          _buildLoginForm(context),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.v),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes
                            .signUpScreen); // Adjust with your actual sign-up route
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Have an account?",
                              style: CustomTextStyles.titleSmallGray400_2,
                            ),
                            TextSpan(
                              text: "Sign",
                              style: CustomTextStyles.titleSmallPrimary,
                            ),
                            TextSpan(
                              text: " ",
                            ),
                            TextSpan(
                              text: "up",
                              style: CustomTextStyles.titleSmallPrimary,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 5.v),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTopLogo(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 461.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgEllipse21,
              height: 461.v,
              width: 428.h,
              alignment: Alignment.center,
            ),
            CustomImageView(
              imagePath: ImageConstant.imgLogowhite1,
              height: 265.v,
              width: 324.h,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 29.v),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildLoginForm(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32.h),
        padding: EdgeInsets.symmetric(
          horizontal: 24.h,
          vertical: 29.v,
        ),
        decoration: AppDecoration.outlineErrorContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 116.h),
                child: Text(
                  "Log in",
                  style: CustomTextStyles.headlineSmallGray400,
                ),
              ),
            ),
            SizedBox(height: 45.v),
            CustomTextFormField(
              controller: phoneNumberController,
              hintText: "Phone number",
              textInputType: TextInputType.phone,
              prefix: Container(
                margin: EdgeInsets.fromLTRB(23.h, 11.v, 12.h, 10.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgCarbonemail,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 45.v,
              ),
              contentPadding: EdgeInsets.only(
                top: 12.v,
                right: 30.h,
                bottom: 12.v,
              ),
              borderDecoration: TextFormFieldStyleHelper.outlineGray,
            ),
            SizedBox(height: 19.v),
            CustomTextFormField(
              controller: passwordController,
              hintText: "Password",
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
              prefix: Container(
                margin: EdgeInsets.fromLTRB(23.h, 11.v, 12.h, 10.v),
                child: CustomImageView(
                  imagePath: ImageConstant.imgRilockpasswordfill,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                ),
              ),
              prefixConstraints: BoxConstraints(
                maxHeight: 45.v,
              ),
              obscureText: true,
              contentPadding: EdgeInsets.only(
                top: 12.v,
                right: 30.h,
                bottom: 12.v,
              ),
              borderDecoration: TextFormFieldStyleHelper.outlineGray,
            ),
            SizedBox(height: 19.v),
            CustomOutlinedButton(
              text: "Log in",
              decoration: BoxDecoration(
                color: ColorSchemes.primaryColorScheme.onPrimary,
              ),
              onPressed: () {
                // Assuming you have a route named 'verificationScreen' set up
                onSubmit(context);
                // Navigator.pushNamed(context, AppRoutes.homeScreen);
              },
            ),
            SizedBox(height: 19.v),
            Text(
              "or",
              style: theme.textTheme.bodyMedium,
            ),
            SizedBox(height: 19.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 23.h,
                  right: 82.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgFacebook,
                      height: 20.v,
                      width: 10.h,
                      margin: EdgeInsets.only(top: 8.v),
                    ),
                    Spacer(),
                    Container(
                      height: 19.adaptSize,
                      width: 19.adaptSize,
                      margin: EdgeInsets.only(bottom: 9.v),
                      decoration: AppDecoration.outlinePrimary1.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder10,
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgFlatColorIconsGoogle,
                        height: 19.adaptSize,
                        width: 19.adaptSize,
                        alignment: Alignment.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 14.h,
                        bottom: 5.v,
                      ),
                      child: Text(
                        "Log in with Google",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40.v),
          ],
        ),
      ),
    );
  }
}
