import 'package:flutter/material.dart';
import 'package:smart_popup/smart_popup.dart';

class LottieAssetHelper {
  static String getLottieAssetPath(PopType? popType, String? lottiePath) {
    switch (popType) {
      case PopType.warning:
        return lottiePath ?? 'https://lottie.host/1bfbe051-ddcf-4be9-b736-494e41f053ce/A9qYeDHwl6.json';
      case PopType.success:
        return lottiePath ?? 'https://lottie.host/f78748c3-18ed-43c7-a611-bbfbd46b687e/2SgjCx5Qzq.json';
      case PopType.error:
        return lottiePath ?? 'https://lottie.host/c9c7f0d7-ded2-4ec3-b3c3-69d138523891/QoeOJH5gsp.json';
      case PopType.info:
        return lottiePath ?? 'https://lottie.host/726e43d1-4aa9-46ff-bca1-651de9c8274d/O6PneKPFVx.json';
      case PopType.delay:
        return lottiePath ?? 'https://lottie.host/09d168d0-8283-4f38-96e4-0e0fab63b2d2/8ywI5bOUVl.json';
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

  static Color getPrimaryButtonTextColor(
      PopType? popType, Color? defaultColor) {
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
        return defaultColor ?? const Color.fromARGB(255, 237, 255, 217);
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

  static Color getSecondaryButtonTextColor(
      PopType? popType, Color? defaultColor) {
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
}
