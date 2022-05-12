import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppInputDecorations {
  static InputDecoration defaultInputDecoration({required String hint}) {
    return InputDecoration(
      fillColor: Get.theme.primaryColor.withOpacity(0.15),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      hintText: hint,
      hintStyle: TextStyle(
        color: Colors.grey.shade700,
      ),
      counterText: "",
      prefixText: "+91 ",
    );
  }
}
