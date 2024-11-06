import 'package:flutter/material.dart';
import 'package:smart_popup/smart_popup.dart';

class LottieAssetHelper {
  static String getLottieAssetPath(PopType? popType, String? lottiePath) {
    switch (popType) {
      case PopType.warning:
        return lottiePath ?? 'assets/lottie/warning.json';
      case PopType.success:
        return lottiePath ?? 'assets/lottie/success.json';
      case PopType.error:
        return lottiePath ?? 'assets/lottie/error.json';
      case PopType.info:
        return lottiePath ?? 'assets/lottie/info.json';
      case PopType.delay:
        return lottiePath ?? 'assets/lottie/delay.json';
      case PopType.loading:
        return lottiePath ?? 'assets/lottie/loading.json';
      default:
        return lottiePath ?? '';
    }
  }

  static Color getPrimaryButtonColor(PopType? popType, Color? defaultColor) {
    switch (popType) {
      case PopType.warning:
        return defaultColor ?? Colors.orange;
      case PopType.success:
        return defaultColor ?? Colors.green;
      case PopType.error:
        return defaultColor ?? Colors.red;
      case PopType.info:
        return defaultColor ?? Colors.blue;
      case PopType.delay:
        return defaultColor ?? Colors.yellow;
      case PopType.loading:
        return defaultColor ?? Colors.grey;
      default:
        return defaultColor ?? const Color(0xFFC4283C);
    }
  }

  static Color getPrimaryButtonTextColor(PopType? popType, Color? defaultColor) {
    switch (popType) {
      case PopType.warning:
        return defaultColor ?? Colors.white;
      case PopType.success:
        return defaultColor ?? Colors.white;
      case PopType.error:
        return defaultColor ?? Colors.white;
      case PopType.info:
        return defaultColor ?? Colors.white;
      case PopType.delay:
        return defaultColor ?? Colors.black;
      case PopType.loading:
        return defaultColor ?? Colors.black;
      default:
        return defaultColor ?? const Color(0XFFFFF1F1);
    }
  }

  static Color? getSecondaryButtonColor(PopType? popType, Color? defaultColor) {
    switch (popType) {
      case PopType.warning:
        return defaultColor ?? Colors.orangeAccent;
      case PopType.success:
        return defaultColor ?? Colors.lightGreen;
      case PopType.error:
        return defaultColor ?? Colors.redAccent;
      case PopType.info:
        return defaultColor ?? Colors.lightBlue;
      case PopType.delay:
        return defaultColor ?? Colors.yellowAccent;
      case PopType.loading:
        return defaultColor ?? Colors.grey[400];
      default:
        return defaultColor ?? const Color(0XFFFFF1F1);
    }
  }

  static Color getSecondaryButtonTextColor(PopType? popType, Color? defaultColor) {
    switch (popType) {
      case PopType.warning:
        return defaultColor ?? Colors.black;
      case PopType.success:
        return defaultColor ?? Colors.black;
      case PopType.error:
        return defaultColor ?? Colors.black;
      case PopType.info:
        return defaultColor ?? Colors.black;
      case PopType.delay:
        return defaultColor ?? Colors.black;
      case PopType.loading:
        return defaultColor ?? Colors.black;
      default:
        return defaultColor ?? Colors.white;
    }
  }
}
