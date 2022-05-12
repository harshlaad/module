import 'package:fluttertoast/fluttertoast.dart';

class AppToast {
  static void showDefaultToast({required String message}) {
    Fluttertoast.showToast(msg: message);
  }
}
