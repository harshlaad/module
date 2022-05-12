import 'package:app/app_configs/app_strings.dart';
import 'package:app/app_configs/routes/app_routes.dart';
import 'package:app/screens/splash/screen/splash_screen.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(392.72, 825.45),
      child: GetMaterialApp(
        title: AppStrings.appName,
        theme: FlexThemeData.light(
          scheme: FlexScheme.amber,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        getPages: AppRoutes.pages,
      ),
    ),
  );
}
