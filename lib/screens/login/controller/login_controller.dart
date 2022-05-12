import 'package:app/screens/dashboard/screen/dashboard_scree.dart';
import 'package:app/utils/app_button.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  TextEditingController phoneController = TextEditingController();

  RoundedLoadingButtonController continueButton =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController submitButton =
      RoundedLoadingButtonController();

  PageController pageController = PageController();

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  GlobalKey<FormState> otpKey = GlobalKey<FormState>();

  Rx<AutovalidateMode> loginAutoValidateMode = AutovalidateMode.disabled.obs;

  String? phoneValidator(String value) {
    if (value == "") {
      return "Please enter phone number";
    } else if (value.length != 10) {
      return "Please enter valid phone number";
    } else {
      return null;
    }
  }

  String? codeValidator(String value) {
    if (value == "") {
      return "Please enter verification code";
    } else if (value.length != 6) {
      return "Please enter valid verification code";
    } else {
      return null;
    }
  }

  Future<void> onContinue() async {
    if (loginKey.currentState!.validate()) {
      loginAutoValidateMode.value = AutovalidateMode.disabled;
      await AppButton.successReset(continueButton);
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      loginAutoValidateMode.value = AutovalidateMode.always;
      await AppButton.errorReset(continueButton);
    }
  }

  Future<void> onSubmit() async {
    if (otpKey.currentState!.validate()) {
      loginAutoValidateMode.value = AutovalidateMode.disabled;
      await AppButton.successReset(submitButton);
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
      Get.offAllNamed(DashboardScreen.routeName);
    } else {
      loginAutoValidateMode.value = AutovalidateMode.always;
      await AppButton.errorReset(submitButton);
    }
  }
}
