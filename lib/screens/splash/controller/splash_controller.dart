import 'dart:developer';

import 'package:app/screens/login/screen/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    log(Get.height.toString());
    log(Get.width.toString());
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(LoginScreen.routeName);
    super.onInit();
  }
}
