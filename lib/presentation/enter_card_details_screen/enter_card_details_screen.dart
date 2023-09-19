import 'package:application8/core/app_export.dart';
import 'package:application8/widgets/app_bar/appbar_image.dart';
import 'package:application8/widgets/app_bar/appbar_title.dart';
import 'package:application8/widgets/app_bar/custom_app_bar.dart';
import 'package:application8/widgets/custom_elevated_button.dart';
import 'package:application8/widgets/custom_floating_text_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class EnterCardDetailsScreen extends StatelessWidget {
  EnterCardDetailsScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController cardNumberController = TextEditingController();

  TextEditingController expirationController = TextEditingController();

  TextEditingController cvvController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: 412.h,
                    child: Column(children: [
                      SizedBox(
                          height: 74.v,
                          width: 412.h,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        height: 74.v,
                                        width: 412.h,
                                        decoration: BoxDecoration(
                                            color: appTheme.green100))),
                                CustomAppBar(
                                    leadingWidth: 41.h,
                                    leading: AppbarImage(
                                        svgPath: ImageConstant.imgArrowleft,
                                        margin: EdgeInsets.only(
                                            left: 17.h,
                                            top: 20.v,
                                            bottom: 20.v),
                                        onTap: () {
                                          onTapArrowleftone(context);
                                        }),
                                    title: AppbarTitle(
                                        text: "Enter card details",
                                        margin: EdgeInsets.only(left: 16.h)),
                                    styleType: Style.bgFill)
                              ])),
                      SizedBox(height: 27.v),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 23.h, right: 23.h, bottom: 4.v),
                                  child: Column(children: [
                                    CustomFloatingTextField(
                                        controller: nameController,
                                        labelText: "Card holder name",
                                        labelStyle:
                                            CustomTextStyles.bodyLargeGray900,
                                        hintText: "Card holder name",
                                        hintStyle:
                                            CustomTextStyles.bodyLargeGray900),
                                    SizedBox(height: 12.v),
                                    CustomFloatingTextField(
                                        controller: cardNumberController,
                                        labelText: "Card Number",
                                        labelStyle:
                                            CustomTextStyles.bodyLargeGray400,
                                        hintText: "Card Number",
                                        textInputType: TextInputType.number),
                                    SizedBox(height: 12.v),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: CustomFloatingTextField(
                                                  margin: EdgeInsets.only(
                                                      right: 8.h),
                                                  controller:
                                                      expirationController,
                                                  labelText:
                                                      "Expiration (MM/YYYY)",
                                                  labelStyle: theme
                                                      .textTheme.bodyLarge!,
                                                  hintText:
                                                      "Expiration (MM/YYYY)",
                                                  suffix: Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 12.h),
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgLock)),
                                                  suffixConstraints:
                                                      BoxConstraints(
                                                          maxHeight: 64.v))),
                                          Expanded(
                                              child: CustomFloatingTextField(
                                                  margin: EdgeInsets.only(
                                                      left: 8.h),
                                                  controller: cvvController,
                                                  labelText: "CVV",
                                                  labelStyle: theme
                                                      .textTheme.bodyLarge!,
                                                  hintText: "CVV",
                                                  textInputAction:
                                                      TextInputAction.done))
                                        ]),
                                    SizedBox(height: 391.v),
                                    CustomElevatedButton(text: "Pay"),
                                    SizedBox(height: 40.v),
                                    SizedBox(width: 72.h, child: Divider())
                                  ]))))
                    ])))));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowleftone(BuildContext context) {
    Navigator.pop(context);
  }
}
