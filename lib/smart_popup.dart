import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_wrap/smart_expand.dart';
import 'package:smart_wrap/smart_wrap.dart';

/// A customizable popup widget for displaying content with various configurations
/// such as titles, buttons, images, videos, animations, and more.
///
/// This widget provides a smart popup with customizable properties for content,
/// animations, buttons, and behavior. It includes support for loading states,
/// timer delays, custom button styles, and multimedia content (images, videos, etc.).
class SmartPopup extends HookWidget {
  /// The title of the popup.
  final String? title;

  /// The subtitle of the popup.
  final String? subTitle;

  /// The content widget inside the popup.
  final Widget? content;

  /// The width of the popup.
  final double? width;

  /// The height of the popup.
  final double? height;

  /// The height of the image inside the popup.
  final double? imageHeight;

  /// The text for the primary action button.
  final String? primaryButtonText;

  /// The text for the secondary action button.
  final String? secondaryButtonText;

  /// The path to an image to display inside the popup.
  final String? imagePath;

  /// The path to a video (coming soon).
  final String? videoPath;

  /// Callback for the primary button tap.
  final VoidCallback? primaryButtonTap;

  /// Callback for the secondary button tap.
  final VoidCallback? secondaryButtonTap;

  /// The delay time for a timer (in seconds).
  final int? timerDelay;

  /// Custom widget to be used as the title.
  final Widget? titleWidget;

  /// The alignment for the description text.
  final TextAlign? descriptionAlign;

  /// The alignment of the main axis (vertical alignment) for the content.
  final MainAxisAlignment? mainAxisAlignment;

  /// The alignment of the cross axis (horizontal alignment) for the content.
  final CrossAxisAlignment? crossAxisAlignment;

  /// The space between the title and the content.
  final double? titleSpacing;

  /// The radius of the buttons (for rounded corners).
  final double? buttonRadius;

  /// The space between the primary and secondary buttons.
  final double? buttonSpacing;

  /// Custom widget for the image to be displayed.
  final Widget? imageWidget;

  /// A flag indicating whether the popup is in a loading state.
  final bool? loading;

  /// A flag indicating whether to display a close button.
  final bool? showCloseButton;

  /// A flag indicating whether to show a divider between the content and buttons.
  final bool? showDivider;

  /// The animation type for the popup (e.g., scale, fade).
  final AnimationType animationType;

  /// The duration of the animation when the popup appears.
  final Duration? animationDuration;

  /// The initial fade-in value for animations.
  final double? fadeBegin;

  /// The volume of the video (from 0.0 to 1.0).
  final double? videoVolume;

  /// The playback speed of the video.
  final double? videoPlayBackSpeed;

  /// The color of the primary action button.
  final Color? primaryButtonColor;

  /// The text color of the primary action button.
  final Color? primaryButtonTextColor;

  /// The color of the secondary action button.
  final Color? secondaryButtonColor;

  /// The text color of the secondary action button.
  final Color? secondaryButtonTextColor;

  /// The background color of the close button.
  final Color? closeButtonBackgroundColor;

  /// The icon color of the close button.
  final Color? closeButtonIconColor;

  /// The color for the loading indicator.
  final Color? loadingColor;

  /// The type of popup (e.g., modal, dialog).
  final PopType? popType;

  /// The path to a Lottie animation to display.
  final String? lottiePath;

  /// The duration for the popup to open.
  final Duration? openDuration;

  /// The font weight for the button text.
  final FontWeight? buttonsFontWeight;

  /// The font size for the button text.
  final double? buttonsFontSize;

  /// The alignment of the buttons (horizontal or vertical).
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
    this.loadingColor,
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
    final String lottieUrlPath =
        LottieAssetHelper.getLottieAssetPath(popType, lottiePath);
    final Future<bool> enableYesButton =
        Future.delayed(Duration(seconds: timerDelay ?? 10), () => true);
    Widget dialogContent = AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      shadowColor: Colors.transparent,
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
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22)),
                      color: Colors.transparent,
                      image: Uri.parse(imagePath.toString()).isAbsolute
                          ? DecorationImage(
                              image: NetworkImage(imagePath ?? ''),
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: AssetImage(imagePath ?? ''),
                              fit: BoxFit.cover),
                    ),
                    width: width ?? 430,
                    height: imageHeight ?? 210,
                  )
                ],
                if (lottieUrlPath != '') ...[
                  const SizedBox(height: 10),
                  Uri.parse(lottieUrlPath).isAbsolute
                      ? Center(
                          child: Lottie.network(lottieUrlPath,
                              fit: BoxFit.cover, height: 130))
                      : Center(
                          child: Lottie.asset(lottieUrlPath,
                              fit: BoxFit.cover, height: 130)),
                ],
                if (imageWidget != null) ...[imageWidget!],
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment:
                      mainAxisAlignment ?? MainAxisAlignment.center,
                  crossAxisAlignment:
                      crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: [
                    if (titleWidget != null) ...[
                      const SizedBox(height: 10),
                      titleWidget ?? const SizedBox.shrink()
                    ],
                    if (title != null) ...[
                      Padding(
                          padding: EdgeInsets.only(left: titleSpacing ?? 0),
                          child: Text(title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.black))),
                      const SizedBox(height: 5),
                    ],
                    if (showDivider == true)
                      const Divider(color: Color.fromARGB(255, 238, 238, 238)),
                    if (subTitle != null) ...[
                      (primaryButtonText == null || secondaryButtonText == null)
                          ? const SizedBox(height: 10)
                          : const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(subTitle.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: const Color(0xFF909090)),
                            textAlign: TextAlign.center),
                      ),
                    ],
                    if (content != null) ...[
                      const SizedBox(height: 10),
                      content ?? const SizedBox.shrink()
                    ],
                    if (primaryButtonText != null ||
                        secondaryButtonText != null)
                      const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: SmartWrap(
                        type: buttonAlignment == ButtonAlignment.horizontal
                            ? WrapType.row
                            : WrapType.column,
                        children: [
                          if (timerDelay != null) ...[
                            SmartExpand(
                              disableExpand:
                                  buttonAlignment == ButtonAlignment.horizontal
                                      ? true
                                      : false,
                              child: FutureBuilder(
                                future: enableYesButton,
                                builder: (context, snapshot) {
                                  return Stack(
                                    children: [
                                      SmartButton(
                                        height: 45,
                                        text: primaryButtonText ?? "Yes",
                                        color: snapshot.data == true
                                            ? LottieAssetHelper
                                                .getPrimaryButtonColor(
                                                    popType, primaryButtonColor)
                                            : Colors.grey,
                                        textColor: LottieAssetHelper
                                            .getPrimaryButtonTextColor(popType,
                                                primaryButtonTextColor),
                                        border: const Border(),
                                        fontWeight: buttonsFontWeight ??
                                            FontWeight.w600,
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
                                              color: snapshot.data == true
                                                  ? Colors.white
                                                  : LottieAssetHelper
                                                      .getPrimaryButtonColor(
                                                          popType,
                                                          primaryButtonColor),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            height: 40,
                                            child: Center(
                                              child: TimerCountdown(
                                                enableDescriptions: false,
                                                timeTextStyle: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                format: CountDownTimerFormat
                                                    .secondsOnly,
                                                endTime: DateTime.now().add(
                                                    Duration(
                                                        seconds:
                                                            timerDelay ?? 10)),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            if (secondaryButtonText != null)
                              buttonAlignment == ButtonAlignment.horizontal
                                  ? const SizedBox(width: 15)
                                  : const SizedBox(height: 15),
                          ],
                          if (timerDelay == null)
                            if (primaryButtonText != null) ...[
                              SmartExpand(
                                disableExpand: buttonAlignment ==
                                        ButtonAlignment.horizontal
                                    ? true
                                    : false,
                                child: SmartButton(
                                  popType: popType,
                                  isLoading: loading ?? false,
                                  loadingColor: loadingColor,
                                  height: 45,
                                  text: primaryButtonText ?? "Yes",
                                  color:
                                      LottieAssetHelper.getPrimaryButtonColor(
                                          popType, primaryButtonColor),
                                  textColor: LottieAssetHelper
                                      .getPrimaryButtonTextColor(
                                          popType, primaryButtonTextColor),
                                  border: const Border(),
                                  fontWeight:
                                      buttonsFontWeight ?? FontWeight.w600,
                                  textSize: buttonsFontSize ?? 14,
                                  onTap: primaryButtonTap ??
                                      () => {Navigator.of(context).pop()},
                                ),
                              ),
                              if (secondaryButtonText != null)
                                buttonAlignment == ButtonAlignment.horizontal
                                    ? const SizedBox(width: 15)
                                    : const SizedBox(height: 15),
                            ],
                          if (secondaryButtonText != null)
                            SmartExpand(
                              disableExpand:
                                  buttonAlignment == ButtonAlignment.horizontal
                                      ? true
                                      : false,
                              child: SmartButton(
                                popType: popType,
                                height: 45,
                                text: secondaryButtonText ?? "No",
                                color:
                                    LottieAssetHelper.getSecondaryButtonColor(
                                        popType, secondaryButtonColor),
                                textColor: LottieAssetHelper
                                    .getSecondaryButtonTextColor(
                                        popType, secondaryButtonTextColor),
                                border: const Border(),
                                fontWeight:
                                    buttonsFontWeight ?? FontWeight.w600,
                                textSize: buttonsFontSize ?? 14,
                                onTap: secondaryButtonTap ??
                                    () => {Navigator.of(context).pop()},
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (height == null &&
                        secondaryButtonText != null &&
                        primaryButtonText != null)
                      const SizedBox(height: 20),
                    if (primaryButtonText == null ||
                        secondaryButtonText == null)
                      const SizedBox(height: 20),
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
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: LottieAssetHelper.getSecondaryButtonColor(
                          popType, closeButtonBackgroundColor)),
                  child: Icon(Icons.close,
                      size: 20,
                      color: LottieAssetHelper.getPrimaryButtonColor(
                          popType, closeButtonIconColor)),
                ),
              ),
            ),
        ],
      ),
    );

    switch (animationType) {
      case AnimationType.fade:
        dialogContent = dialogContent.animate().fade(
            duration: animationDuration ?? const Duration(milliseconds: 500),
            begin: fadeBegin ?? 0.0,
            end: 1.0,
            curve: Curves.easeIn);
        break;
      case AnimationType.scale:
        dialogContent = dialogContent
            .animate()
            .fade(begin: 0, end: 1, duration: const Duration(microseconds: 300))
            .scale(
                duration:
                    animationDuration ?? const Duration(milliseconds: 140),
                begin: const Offset(.8, .8),
                end: const Offset(1, 1),
                curve: Curves.easeIn);
        break;
      case AnimationType.slide:
        dialogContent = dialogContent
            .animate()
            .scale(
                duration:
                    animationDuration ?? const Duration(milliseconds: 250),
                begin: const Offset(.95, .95),
                end: const Offset(1, 1),
                curve: Curves.easeInOut)
            .fade(
                begin: 0.2,
                end: 1,
                duration: const Duration(milliseconds: 200));
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

class LottieAssetHelper {
  static String getLottieAssetPath(PopType? popType, String? lottiePath) {
    switch (popType) {
      case PopType.warning:
        return lottiePath ??
            'https://lottie.host/1bfbe051-ddcf-4be9-b736-494e41f053ce/A9qYeDHwl6.json';
      case PopType.success:
        return lottiePath ??
            'https://lottie.host/f78748c3-18ed-43c7-a611-bbfbd46b687e/2SgjCx5Qzq.json';
      case PopType.error:
        return lottiePath ??
            'https://lottie.host/c9c7f0d7-ded2-4ec3-b3c3-69d138523891/QoeOJH5gsp.json';
      case PopType.info:
        return lottiePath ??
            'https://lottie.host/726e43d1-4aa9-46ff-bca1-651de9c8274d/O6PneKPFVx.json';
      case PopType.delay:
        return lottiePath ??
            'https://lottie.host/09d168d0-8283-4f38-96e4-0e0fab63b2d2/8ywI5bOUVl.json';
      case PopType.loading:
        return lottiePath ??
            'https://lottie.host/09d168d0-8283-4f38-96e4-0e0fab63b2d2/8ywI5bOUVl.json';
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
        return defaultColor ?? Colors.blue;
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
        return defaultColor ?? Colors.white;
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
        return defaultColor ?? const Color(0XFFE0F2FE);
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
        return defaultColor ?? Colors.blue;
    }
  }
}

/// A customizable button widget that supports text, icons, loading states, and more.
///
/// This button widget provides flexibility for creating buttons with text, icons,
/// custom loading states, and different visual properties like size, color, border radius,
/// and more. It also supports handling tap and long press events, ellipsis overflow,
/// and mouse cursor customization for better interactivity.

class SmartButton extends StatelessWidget {
  /// The text to display on the button.
  final String? text;

  /// The icon to display on the button.
  final IconData? icon;

  /// Callback for the button tap event.
  final VoidCallback? onTap;

  /// Callback for the button long press event.
  final VoidCallback? onLongPress;

  /// The width of the button.
  final double? width;

  /// The height of the button.
  final double? height;

  /// The size of the text in the button.
  final double? textSize;

  /// The size of the icon in the button.
  final double? iconSize;

  /// The border radius of the button.
  final BorderRadiusGeometry? borderRadius;

  /// The radius for the splash effect when the button is pressed.
  final BorderRadius? splashRadius;

  /// The border of the button.
  final BoxBorder? border;

  /// The background color of the button.
  final Color? color;

  /// The color of the icon.
  final Color? iconColor;

  /// The color of the text in the button.
  final Color? textColor;

  /// The style for the text in the button.
  final TextStyle? textStyle;

  /// The font weight of the text.
  final FontWeight? fontWeight;

  /// A custom widget to be used as button text.
  final Widget? buttonText;

  /// A custom widget to be used as the icon.
  final Widget? iconWidget;

  /// The focus node for managing focus on the button.
  final FocusNode? focusNode;

  /// The color of the loading indicator.
  final Color? loadingColor;

  /// A flag indicating whether the button is in a loading state.
  final bool? isLoading;

  /// A custom widget to display during the loading state.
  final Widget? customLoading;

  /// A flag indicating whether to show text overflow with ellipsis when text is too long.
  final bool? ellipsisOverFlow;

  /// The mouse cursor to use when the button is hovered over.
  final MouseCursor? mouseCursor;

  /// The type of popup for the button (if applicable).
  final PopType? popType;

  /// The primary button color.
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
    this.isLoading,
    this.customLoading,
    this.onLongPress,
    this.ellipsisOverFlow = false,
    this.mouseCursor,
    this.popType,
    this.primaryButtonColor,
    this.loadingColor,
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
    final smartButtonColor = isLoading == true
        ? LottieAssetHelper.getPrimaryButtonColor(popType, primaryButtonColor)
        : color ?? Colors.white;
    final smartAllTextColor =
        textColor ?? smartTextColor(context, smartButtonColor);
    return InkWell(
      focusNode: focusNode ?? FocusNode(),
      borderRadius: BorderRadius.circular(12),
      onTap: isLoading == true ? null : onTap,
      onLongPress: isLoading == true ? null : onLongPress,
      mouseCursor: isLoading == true
          ? SystemMouseCursors.forbidden
          : (mouseCursor ?? SystemMouseCursors.click),
      child: Container(
        width: width,
        height: height ?? 45,
        decoration: BoxDecoration(
            color: smartButtonColor,
            borderRadius: BorderRadius.circular(12),
            border: isLoading == true ? null : border ?? const Border()),
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
                            color: LottieAssetHelper.getPrimaryButtonTextColor(
                                popType, loadingColor ?? Colors.white),
                          ),
                        )
                  ]
                : [
                    if (iconWidget != null)
                      iconWidget!
                    else if (icon != null)
                      Icon(icon,
                          size: iconSize ?? 20,
                          color: iconColor ?? smartAllTextColor),
                    if (text != null || buttonText != null) ...[
                      if (icon != null || iconWidget != null)
                        const SizedBox(width: 8),
                      if (buttonText != null)
                        buttonText ?? const SizedBox.shrink(),
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
