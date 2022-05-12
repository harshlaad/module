import 'package:app/app_configs/app_images.dart';
import 'package:app/screens/login/controller/login_controller.dart';
import 'package:app/utils/app_button.dart';
import 'package:app/utils/app_input_decorations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginScreen extends GetView<LoginController> {
  static const String routeName = "/loginScreen";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              image(),
              SizedBox(
                height: Get.height * 0.55,
                width: Get.width,
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: [
                    child1(),
                    child2(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column child2(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: AppButton.backButton(
            onPresssed: () {
              controller.pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            children: [
              Text(
                "We send verification code on phone number",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: LottieBuilder.asset(
                  AppImages.message,
                  repeat: false,
                ),
              ),
              Form(
                key: controller.otpKey,
                child: PinCodeTextField(
                  backgroundColor: Colors.transparent,
                  validator: (value) => controller.codeValidator(value!),
                  autoDismissKeyboard: true,
                  enablePinAutofill: true,
                  length: 6,
                  obscureText: false,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  animationType: AnimationType.scale,
                  keyboardType: TextInputType.phone,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 2,
                    borderRadius: BorderRadius.circular(10.r),
                    // fieldHeight: 50,
                    // fieldWidth: 40,
                    activeFillColor: Colors.white,
                    activeColor: Get.theme.primaryColor,
                    inactiveColor: Colors.grey.shade300,
                    selectedColor: Get.theme.primaryColor,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: false,
                  onCompleted: (value) {
                    // _controller.changeCode(value);
                  },
                  onChanged: (value) {},
                  appContext: context,
                ),
              ),
              Container(
                height: 20.h,
              ),
              AppButton.defaultButton(
                controller: controller.submitButton,
                onPressed: () {
                  controller.onSubmit();
                },
                child: "Submit",
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget child1() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            "Carpenter App",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              const Expanded(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
              SizedBox(width: 10.w),
              const Text(
                "Log in or sign up",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 10.w),
              const Expanded(
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60.h,
          ),
          Form(
            key: controller.loginKey,
            child: Obx(
              () => TextFormField(
                autovalidateMode: controller.loginAutoValidateMode.value,
                validator: (value) => controller.phoneValidator(value!),
                controller: controller.phoneController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                maxLength: 10,
                decoration: AppInputDecorations.defaultInputDecoration(
                  hint: "Enter phone number",
                ),
              ),
            ),
          ),
          Container(
            height: 20.h,
          ),
          AppButton.defaultButton(
            controller: controller.continueButton,
            onPressed: () async {
              await controller.onContinue();
            },
            child: "Continue",
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  SizedBox image() {
    return SizedBox(
      height: Get.height * 0.40,
      child: Container(
        color: Get.theme.primaryColor,
        child: const Center(
          child: Text(
            "Image",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
