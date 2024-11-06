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
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
      case PopType.info:
        return defaultColor ?? Colors.blue;
      case PopType.delay:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
      case PopType.loading:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
      default:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
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
        return defaultColor ?? Colors.white;
      case PopType.loading:
        return defaultColor ?? Colors.white;
      default:
        return defaultColor ?? const Color(0XFFFFF1F1);
    }
  }

  static Color? getSecondaryButtonColor(PopType? popType, Color? defaultColor) {
    switch (popType) {
      case PopType.warning:
        return defaultColor ?? const Color.fromARGB(255, 255, 246, 230);
      case PopType.success:
        return defaultColor ?? Colors.lightGreen;
      case PopType.error:
        return defaultColor ?? const Color(0XFFFFF1F1);
      case PopType.info:
        return defaultColor ?? const Color(0XFFE0F2FE);
      case PopType.delay:
        return defaultColor ?? const Color(0XFFFFF1F1);
      case PopType.loading:
        return defaultColor ?? const Color(0XFFFFF1F1);
      default:
        return defaultColor ?? const Color(0XFFFFF1F1);
    }
  }

  static Color getSecondaryButtonTextColor(PopType? popType, Color? defaultColor) {
    switch (popType) {
      case PopType.warning:
        return defaultColor ?? Colors.orange;
      case PopType.success:
        return defaultColor ?? Colors.black;
      case PopType.error:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
      case PopType.info:
        return defaultColor ?? Colors.blue;
      case PopType.delay:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
      case PopType.loading:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
      default:
        return defaultColor ?? const Color.fromARGB(255, 196, 40, 60);
    }
  }
}
