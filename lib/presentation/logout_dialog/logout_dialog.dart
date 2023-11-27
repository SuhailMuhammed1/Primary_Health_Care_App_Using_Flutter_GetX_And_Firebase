import 'package:phc_lab/Firebase_authentication/authentication_repository.dart';
import 'controller/logout_controller.dart';
import 'package:flutter/material.dart';
import 'package:phc_lab/core/app_export.dart';
import 'package:phc_lab/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class LogOutDialog extends StatelessWidget {
  LogOutDialog(this.controller, {Key? key}) : super(key: key);

  LogOutController controller;

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return Container(
      width: 327.h,
      padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 36.v),
      decoration: AppDecoration.white
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SizedBox(height: 26.v),
          Text("lbl_logout".tr, style: theme.textTheme.titleLarge),
          SizedBox(height: 6.v),
          SizedBox(
            child: Text("msg_do_you".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodyLargeBluegray400
                  .copyWith(height: 1.50),
            ),
          ),
          SizedBox(height: 22.v),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded( // Wrap the first button with Expanded
                child: CustomElevatedButton(
                  text: "lbl_yes".tr,
                  onPressed: () {
                    AuthenticationRepository.instance.logout();
                    Get.offAllNamed(AppRoutes.loginScreen);
                    },
                ),
              ),
              SizedBox(width: 16.h), // Space between buttons
              Expanded( // Wrap the second button with Expanded
                child: CustomElevatedButton(
                  text: "lbl_no".tr,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
