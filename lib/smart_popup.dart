import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_popup/src/helper.dart';
import 'package:smart_wrap/smart_expand.dart';
import 'package:smart_wrap/smart_wrap.dart';

import 'src/custom_button.dart';

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
  final String? videoPath;
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
  final bool? showButtons;
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
    this.showButtons = true,
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
                      image: DecorationImage(image: AssetImage(imagePath ?? ''), fit: BoxFit.cover),
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
                      SizedBox(height: showButtons == true ? 20 : 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(subTitle.toString(), style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xFF909090)), textAlign: TextAlign.center),
                      ),
                    ],
                    if (content != null) ...[const SizedBox(height: 10), content ?? const SizedBox.shrink()],
                    if (showButtons == true) ...[
                      const SizedBox(height: 30),
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
                                          CustomButton(
                                            popType: popType,
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
                                buttonAlignment == ButtonAlignment.horizontal ? const SizedBox(width: 15) : const SizedBox(height: 15),
                              ],
                              if (timerDelay == null)
                                if (primaryButtonText != null) ...[
                                  SmartExpand(
                                    disableExpand: buttonAlignment == ButtonAlignment.horizontal ? true : false,
                                    child: CustomButton(
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
                                  buttonAlignment == ButtonAlignment.horizontal ? const SizedBox(width: 15) : const SizedBox(height: 15),
                                ],
                              if (secondaryButtonText != null)
                                SmartExpand(
                                  disableExpand: buttonAlignment == ButtonAlignment.horizontal ? true : false,
                                  child: CustomButton(
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
                          )),
                      if (height == null && secondaryButtonText != null && primaryButtonText != null) const SizedBox(height: 20),
                    ],
                    if (showButtons == false) const SizedBox(height: 20),
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
