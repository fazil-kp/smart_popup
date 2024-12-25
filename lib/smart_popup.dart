import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_wrap/smart_expand.dart';
import 'package:smart_wrap/smart_wrap.dart';

class SmartPopup extends HookWidget {
  final String? title;
  final String? subTitle;
  final Widget? content;
  final double? width;
  final double? height;
  final double? imageHeight;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final String? imagePath;
  final String? videoPath; // commmmming sooooooon!
  final VoidCallback? primaryButtonTap;
  final VoidCallback? secondaryButtonTap;
  final int? timerDelay;
  final Widget? titleWidget;
  final TextAlign? descriptionAlign;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? titleSpacing;
  final double? buttonRadius;
  final double? buttonSpacing;
  final Widget? imageWidget;
  final bool? loading;
  final bool? showCloseButton;
  final bool? showDivider;
  final AnimationType animationType;
  final Duration? animationDuration;
  final double? fadeBegin;
  final double? videoVolume;
  final double? videoPlayBackSpeed;
  final Color? primaryButtonColor;
  final Color? primaryButtonTextColor;
  final Color? secondaryButtonColor;
  final Color? secondaryButtonTextColor;
  final Color? closeButtonBackgroundColor;
  final Color? closeButtonIconColor;
  final PopType? popType;
  final String? lottiePath;
  final Duration? openDuration;
  final FontWeight? buttonsFontWeight;
  final double? buttonsFontSize;
  final ButtonAlignment? buttonAlignment;

  const SmartPopup({
    super.key,
    this.title,
    this.loading,
    this.imageWidget,
    this.buttonRadius,
    this.buttonSpacing,
    this.subTitle,
    this.primaryButtonTap,
    this.secondaryButtonTap,
    this.content,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.width,
    this.height,
    this.imagePath,
    this.videoPath,
    this.imageHeight,
    this.timerDelay,
    this.titleWidget,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.descriptionAlign,
    this.titleSpacing,
    this.animationType = AnimationType.scale,
    this.animationDuration,
    this.fadeBegin = 0.0,
    this.showCloseButton = true,
    this.videoVolume,
    this.videoPlayBackSpeed,
    this.primaryButtonColor,
    this.primaryButtonTextColor,
    this.secondaryButtonColor,
    this.secondaryButtonTextColor,
    this.closeButtonBackgroundColor,
    this.closeButtonIconColor,
    this.popType,
    this.lottiePath,
    this.showDivider = true,
    this.openDuration,
    this.buttonsFontWeight,
    this.buttonsFontSize,
    this.buttonAlignment = ButtonAlignment.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      if (openDuration != null) {
        final timer = Timer(openDuration!, () {
          if (Navigator.of(context).canPop()) Navigator.of(context).pop();
        });
        return timer.cancel;
      }
      return null;
    }, [openDuration]);
    final String lottieUrlPath = LottieAssetHelper.getLottieAssetPath(popType, lottiePath);
    final Future<bool> enableYesButton = Future.delayed(Duration(seconds: timerDelay ?? 10), () => true);
    Widget dialogContent = AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), side: const BorderSide(color: Color(0xFFD9D9D9), width: 0.1)),
      shadowColor: const Color.fromARGB(255, 238, 238, 238).withOpacity(0.4),
      elevation: 15,
      content: Stack(
        children: [
          SizedBox(
            width: width ?? 430,
            height: height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imagePath != null) ...[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
                      color: Colors.white,
                      image: Uri.parse(imagePath.toString()).isAbsolute ? DecorationImage(image: NetworkImage(imagePath ?? ''), fit: BoxFit.cover) : DecorationImage(image: AssetImage(imagePath ?? ''), fit: BoxFit.cover),
                    ),
                    width: width ?? 430,
                    height: imageHeight ?? 210,
                  )
                ],
                if (lottieUrlPath != '') ...[
                  const SizedBox(height: 10),
                  Uri.parse(lottieUrlPath).isAbsolute ? Center(child: Lottie.network(lottieUrlPath, fit: BoxFit.cover, height: 130)) : Center(child: Lottie.asset(lottieUrlPath, fit: BoxFit.cover, height: 130)),
                ],
                if (imageWidget != null) ...[imageWidget!],
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                  crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: [
                    if (titleWidget != null) ...[const SizedBox(height: 10), titleWidget ?? const SizedBox.shrink()],
                    if (title != null) ...[
                      Padding(padding: EdgeInsets.only(left: titleSpacing ?? 0), child: Text(title ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black))),
                      const SizedBox(height: 5),
                    ],
                    if (showDivider == true) const Divider(color: Color.fromARGB(255, 238, 238, 238)),
                    if (subTitle != null) ...[
                      (primaryButtonText == null || secondaryButtonText == null) ? const SizedBox(height: 10) : const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(subTitle.toString(), style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xFF909090)), textAlign: TextAlign.center),
                      ),
                    ],
                    if (content != null) ...[const SizedBox(height: 10), content ?? const SizedBox.shrink()],
                    if (primaryButtonText != null || secondaryButtonText != null) const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SmartWrap(
                        type: buttonAlignment == ButtonAlignment.horizontal ? WrapType.row : WrapType.column,
                        children: [
                          if (timerDelay != null) ...[
                            SmartExpand(
                              disableExpand: buttonAlignment == ButtonAlignment.horizontal ? true : false,
                              child: FutureBuilder(
                                future: enableYesButton,
                                builder: (context, snapshot) {
                                  return Stack(
                                    children: [
                                      SmartButton(
                                        height: 45,
                                        text: primaryButtonText ?? "Yes",
                                        color: snapshot.data == true ? LottieAssetHelper.getPrimaryButtonColor(popType, primaryButtonColor) : Colors.grey.withOpacity(.5),
                                        textColor: LottieAssetHelper.getPrimaryButtonTextColor(popType, primaryButtonTextColor),
                                        border: const Border(),
                                        fontWeight: buttonsFontWeight ?? FontWeight.w600,
                                        textSize: buttonsFontSize ?? 14,
                                        onTap: () {
                                          if (snapshot.data == true) {
                                            primaryButtonTap!();
                                          }
                                        },
                                      ),
                                      if (snapshot.data != true)
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          left: 0,
                                          bottom: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: snapshot.data == true ? Colors.white : LottieAssetHelper.getPrimaryButtonColor(popType, primaryButtonColor),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            height: 40,
                                            child: Center(
                                              child: TimerCountdown(
                                                enableDescriptions: false,
                                                timeTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                                format: CountDownTimerFormat.secondsOnly,
                                                endTime: DateTime.now().add(Duration(seconds: timerDelay ?? 10)),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            if (secondaryButtonText != null) buttonAlignment == ButtonAlignment.horizontal ? const SizedBox(width: 15) : const SizedBox(height: 15),
                          ],
                          if (timerDelay == null)
                            if (primaryButtonText != null) ...[
                              SmartExpand(
                                disableExpand: buttonAlignment == ButtonAlignment.horizontal ? true : false,
                                child: SmartButton(
                                  popType: popType,
                                  isLoading: loading ?? false,
                                  height: 45,
                                  text: primaryButtonText ?? "Yes",
                                  color: LottieAssetHelper.getPrimaryButtonColor(popType, primaryButtonColor),
                                  textColor: LottieAssetHelper.getPrimaryButtonTextColor(popType, primaryButtonTextColor),
                                  border: const Border(),
                                  fontWeight: buttonsFontWeight ?? FontWeight.w600,
                                  textSize: buttonsFontSize ?? 14,
                                  onTap: primaryButtonTap ?? () => {Navigator.of(context).pop()},
                                ),
                              ),
                              if (secondaryButtonText != null) buttonAlignment == ButtonAlignment.horizontal ? const SizedBox(width: 15) : const SizedBox(height: 15),
                            ],
                          if (secondaryButtonText != null)
                            SmartExpand(
                              disableExpand: buttonAlignment == ButtonAlignment.horizontal ? true : false,
                              child: SmartButton(
                                popType: popType,
                                height: 45,
                                text: secondaryButtonText ?? "No",
                                color: LottieAssetHelper.getSecondaryButtonColor(popType, secondaryButtonColor),
                                textColor: LottieAssetHelper.getSecondaryButtonTextColor(popType, secondaryButtonTextColor),
                                border: const Border(),
                                fontWeight: buttonsFontWeight ?? FontWeight.w600,
                                textSize: buttonsFontSize ?? 14,
                                onTap: secondaryButtonTap ?? () => {Navigator.of(context).pop()},
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (height == null && secondaryButtonText != null && primaryButtonText != null) const SizedBox(height: 20),
                    if (primaryButtonText == null || secondaryButtonText == null) const SizedBox(height: 20),
                  ],
                ),
              ],
            ),
          ),
          if (showCloseButton == true)
            Positioned(
              top: 16,
              right: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: LottieAssetHelper.getSecondaryButtonColor(popType, closeButtonBackgroundColor)),
                  child: Icon(Icons.close, size: 20, color: LottieAssetHelper.getPrimaryButtonColor(popType, closeButtonIconColor)),
                ),
              ),
            ),
        ],
      ),
    );

    switch (animationType) {
      case AnimationType.fade:
        dialogContent = dialogContent.animate().fade(duration: animationDuration ?? const Duration(milliseconds: 500), begin: fadeBegin ?? 0.0, end: 1.0, curve: Curves.easeIn);
        break;
      case AnimationType.scale:
        dialogContent = dialogContent.animate().fade(begin: 0, end: 1, duration: const Duration(microseconds: 300)).scale(duration: animationDuration ?? const Duration(milliseconds: 140), begin: const Offset(.8, .8), end: const Offset(1, 1), curve: Curves.easeIn);
        break;
      case AnimationType.slide:
        dialogContent = dialogContent.animate().scale(duration: animationDuration ?? const Duration(milliseconds: 250), begin: const Offset(.95, .95), end: const Offset(1, 1), curve: Curves.easeInOut).fade(begin: 0.2, end: 1, duration: const Duration(milliseconds: 200));
        break;
      case AnimationType.none:
        dialogContent = dialogContent;
        break;
      default:
        dialogContent = dialogContent;
        break;
    }
    return dialogContent;
  }
}

enum AnimationType { fade, rotate, scale, slide, size, switcher, none }

enum PopType { info, warning, success, error, delay, loading }

enum ButtonAlignment { horizontal, vertical }

class SmartButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final double? width;
  final double? height;
  final double? textSize;
  final double? iconSize;
  final BorderRadiusGeometry? borderRadius;
  final BorderRadius? splashRadius;
  final BoxBorder? border;
  final Color? color;
  final Color? iconColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final Widget? buttonText;
  final Widget? iconWidget;
  final FocusNode? focusNode;
  final Color? tooltipBackground;
  final Color? tooltipForeground;
  final bool? isLoading;
  final Widget? customLoading;
  final bool? ellipsisOverFlow;
  final MouseCursor? mouseCursor;
  final PopType? popType;
  final Color? primaryButtonColor;

  const SmartButton({
    super.key,
    this.text,
    this.icon,
    this.onTap,
    this.width,
    this.height,
    this.textSize,
    this.iconSize,
    this.borderRadius,
    this.splashRadius,
    this.border,
    this.color,
    this.iconColor,
    this.textColor,
    this.textStyle,
    this.fontWeight,
    this.buttonText,
    this.iconWidget,
    this.focusNode,
    this.tooltipBackground,
    this.tooltipForeground,
    this.isLoading,
    this.customLoading,
    this.onLongPress,
    this.ellipsisOverFlow = false,
    this.mouseCursor,
    this.popType,
    this.primaryButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return smartButtonWidget(context);
  }

  Color smartTextColor(BuildContext context, Color? buttonColor) {
    if (buttonColor == null) return Colors.black;
    final double luminance = buttonColor.computeLuminance();
    return luminance > 0.8 ? Colors.black : Colors.white;
  }

  Widget smartButtonWidget(BuildContext context) {
    final smartButtonColor = isLoading == true ? LottieAssetHelper.getPrimaryButtonColor(popType, primaryButtonColor) : color ?? Colors.white;
    final smartAllTextColor = textColor ?? smartTextColor(context, smartButtonColor);
    return InkWell(
      focusNode: focusNode ?? FocusNode(),
      borderRadius: BorderRadius.circular(12),
      onTap: isLoading == true ? null : onTap,
      onLongPress: isLoading == true ? null : onLongPress,
      mouseCursor: isLoading == true ? SystemMouseCursors.forbidden : (mouseCursor ?? SystemMouseCursors.click),
      child: Container(
        width: width,
        height: height ?? 45,
        decoration: BoxDecoration(color: smartButtonColor, borderRadius: BorderRadius.circular(12), border: isLoading == true ? null : border ?? const Border()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isLoading == true
                ? [
                    customLoading ??
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: LottieAssetHelper.getPrimaryButtonTextColor(popType, Colors.white),
                          ),
                        )
                  ]
                : [
                    if (iconWidget != null) iconWidget! else if (icon != null) Icon(icon, size: iconSize ?? 20, color: iconColor ?? smartAllTextColor),
                    if (text != null || buttonText != null) ...[
                      if (icon != null || iconWidget != null) const SizedBox(width: 8),
                      if (buttonText != null) buttonText ?? const SizedBox.shrink(),
                      if (buttonText == null && ellipsisOverFlow == false)
                        Text(
                          text!,
                          overflow: TextOverflow.ellipsis,
                          style: textStyle ??
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: fontWeight ?? FontWeight.w500,
                                    fontSize: textSize ?? 14,
                                    color: smartAllTextColor,
                                  ),
                        ),
                      if (buttonText == null && ellipsisOverFlow == true)
                        SizedBox(
                          width: ((width ?? 0) - 22),
                          child: Text(
                            text!,
                            overflow: TextOverflow.ellipsis,
                            style: textStyle ??
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: fontWeight ?? FontWeight.w500,
                                      fontSize: textSize ?? 14,
                                      color: smartAllTextColor,
                                    ),
                          ),
                        ),
                    ],
                  ],
          ),
        ),
      ),
    );
  }
}

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
        return lottiePath ?? 'https://lottie.host/09d168d0-8283-4f38-96e4-0e0fab63b2d2/8ywI5bOUVl.json';
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

  static Color getSecondaryButtonTextColor(PopType? popType, Color? defaultColor) {
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
