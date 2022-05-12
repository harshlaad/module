import 'package:app/app_configs/routes/app_bindings.dart';
import 'package:app/screens/dashboard/screen/dashboard_scree.dart';
import 'package:app/screens/login/screen/login_screen.dart';
import 'package:app/screens/splash/screen/splash_screen.dart';
import 'package:get/route_manager.dart';

class AppRoutes {
  static List<GetPage> pages = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: LoginScreen.routeName,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: DashboardScreen.routeName,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    )
  ];
}
