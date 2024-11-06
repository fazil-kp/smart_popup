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
}
