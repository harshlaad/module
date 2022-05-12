import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashboardController extends GetxController {
  List<Widget> listScreen = [
    const Text("home"),
    const Text("Setting"),
    const Text("Profile")
  ];

  List<PersistentBottomNavBarItem> listNavbarItem = [
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Get.theme.primaryColor,
      activeColorPrimary: Get.theme.primaryColor,
      icon: const Icon(Icons.home),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Get.theme.primaryColor,
      activeColorPrimary: Get.theme.primaryColor,
      icon: const Icon(Icons.settings),
    ),
    PersistentBottomNavBarItem(
      inactiveColorPrimary: Get.theme.primaryColor,
      activeColorPrimary: Get.theme.primaryColor,
      icon: const Icon(Icons.person),
    ),
  ];
}
