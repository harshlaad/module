import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class AppButton {
  static RoundedLoadingButton defaultButton({
    required RoundedLoadingButtonController controller,
    required Function() onPressed,
    required String child,
  }) {
    return RoundedLoadingButton(
      height: 45.h,
      borderRadius: 10.r,
      color: Get.theme.primaryColor,
      controller: controller,
      onPressed: onPressed,
      child: Text(child),
    );
  }

  static IconButton backButton({Function()? onPresssed}) {
    return IconButton(
      onPressed: onPresssed,
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  static successReset(RoundedLoadingButtonController controller) async {
    await Future.delayed(const Duration(seconds: 1));
    controller.success();
    await Future.delayed(const Duration(seconds: 1));
    controller.reset();
    await Future.delayed(const Duration(milliseconds: 500));
  }

  static errorReset(RoundedLoadingButtonController controller) async {
    await Future.delayed(const Duration(seconds: 1));
    controller.error();
    await Future.delayed(const Duration(seconds: 1));
    controller.reset();
    await Future.delayed(const Duration(milliseconds: 500));
  }
}
