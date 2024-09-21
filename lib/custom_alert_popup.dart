import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import 'elements/custom_button.dart';
import 'elements/popup_video.dart';
import 'elements/responsive_helper.dart';


/// A customizable alert dialog widget for Flutter applications.
///
/// The [CustomAlertPopup] class provides a highly configurable dialog that can
/// display various types of content including images, videos, and custom widgets.
/// It supports multiple animation types, countdown timers, and responsive design,
/// making it suitable for a wide range of use cases in your application.
///
/// ## Features:
/// - **Customizable content:** Display text, images, videos, or any custom widget.
/// - **Flexible layout:** Adjust width, height, and alignments of the dialog content.
/// - **Animation options:** Choose from multiple animation types for showing/hiding the dialog.
/// - **Countdown timers:** Include a countdown timer that can control button visibility.
/// - **Responsive design:** Automatically adjust to different screen sizes, especially for desktop.
///
/// ## Parameters:
/// - `title`: The title of the alert dialog.
/// - `description`: The description text to display in the alert dialog.
/// - `customWidget`: A custom widget that can be displayed within the dialog.
/// - `width`: The width of the alert dialog.
/// - `height`: The height of the alert dialog.
/// - `imageHeight`: Height of the image displayed in the alert dialog.
/// - `firstButtonText`: Text for the first action button.
/// - `secondButtonText`: Text for the second action button.
/// - `imagePath`: Path to the image to be displayed in the alert dialog.
/// - `videoPath`: Path to the video to be displayed in the alert dialog.
/// - `firstButtonTap`: Callback function for the first button tap.
/// - `secondButtonTap`: Callback function for the second button tap.
/// - `timerDelay`: Delay for the countdown timer in seconds.
/// - `hideButton`: Whether to hide the buttons.
/// - `widget`: Additional widget to display in the alert dialog.
/// - `descriptionAlign`: Text alignment for the description text.
/// - `mainAxisAlignment`: Main axis alignment for the dialog content.
/// - `crossAxisAlignment`: Cross axis alignment for the dialog content.
/// - `titleSpacing`: Spacing before the title text.
/// - `firstButtonWidth`: Width of the first button.
/// - `secondButtonWidth`: Width of the second button.
/// - `buttonRadius`: Radius of the buttons for rounded corners.
/// - `buttonSpacing`: Spacing between the buttons.
/// - `imageWidget`: A custom image widget to display.
/// - `loading`: Whether to show a loading indicator on the buttons.
/// - `hideCloseButton`: Whether to hide the close button.
/// - `animationType`: The type of animation to use for the dialog's appearance.
/// - `animationDuration`: The duration of the animation effect.
/// - `fadeBegin`: Starting value for fade animation.
///
/// ## Usage:
/// To use the [CustomAlertPopup], simply create an instance and provide the
/// necessary parameters. Call the `showDialog` function to display it in your app.
class CustomAlertPopup extends StatelessWidget {
  // Title of the alert dialog
  final String? title;

  // Description text of the alert dialog
  final String? description;

  // Custom widget to display in the alert dialog
  final Widget? customWidget;

  // Width of the alert dialog
  final double? width;

  // Height of the alert dialog
  final double? height;

  // Height of the image displayed in the alert dialog
  final double? imageHeight;

  // Text for the first button
  final String? firstButtonText;

  // Text for the second button
  final String? secondButtonText;

  // Path to the image to display in the alert dialog
  final String? imagePath;

  // Path to the video to display in the alert dialog
  final String? videoPath;

  // Callback function for the first button tap
  final VoidCallback? firstButtonTap;

  // Callback function for the second button tap
  final VoidCallback? secondButtonTap;

  // Delay for the countdown timer in seconds
  final int? timerDelay;

  // Whether to hide the buttons
  final bool? hideButton;

  // Additional widget to display in the alert dialog
  final Widget? widget;

  // Text alignment for the description
  final TextAlign? descriptionAlign;

  // MainAxisAlignment for the column
  final MainAxisAlignment? mainAxisAlignment;

  // CrossAxisAlignment for the column
  final CrossAxisAlignment? crossAxisAlignment;

  // Spacing before the title text
  final double? titleSpacing;

  // Width of the first button
  final double? firstButtonWidth;

  // Width of the second button
  final double? secondButtonWidth;

  // Radius of the buttons
  final double? buttonRadius;

  // Spacing between the buttons
  final double? buttonSpacing;

  // Custom image widget to display
  final Widget? imageWidget;

  // Whether to show a loading indicator on the buttons
  final bool? loading;

  // Whether to hide the close button
  final bool? hideCloseButton;

  // Type of animation for the dialog
  final AnimationType animationType;

  // Duration of the animation
  final Duration? animationDuration;

  // Beginning value for the fade animation
  final double? fadeBegin;

  /// Creates a [CustomAlertPopup] widget.
  const CustomAlertPopup({
    super.key,
    this.title,
    this.loading,
    this.imageWidget,
    this.buttonRadius,
    this.buttonSpacing,
    this.description,
    this.firstButtonTap,
    this.secondButtonTap,
    this.customWidget,
    this.firstButtonText,
    this.secondButtonText,
    this.width,
    this.height,
    this.imagePath,
    this.videoPath,
    this.imageHeight,
    this.timerDelay,
    this.hideButton,
    this.widget,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.descriptionAlign,
    this.titleSpacing,
    this.firstButtonWidth,
    this.secondButtonWidth,
    this.animationType = AnimationType.scale,
    this.animationDuration,
    this.fadeBegin = 0.0,
    this.hideCloseButton = true,
  });

  @override
  Widget build(BuildContext context) {
    final Future<bool> enableYesButton = Future.delayed(Duration(seconds: timerDelay ?? 10), () => true);
    final isDesktop = ResponsiveHelper.isDesktop(context);
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
                if (imageWidget != null) ...[imageWidget!],
                if (videoPath != null) PopupVideo(videoPath: videoPath ?? ''),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                  crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
                  children: [
                    if (widget != null) ...[const SizedBox(height: 10), widget ?? const SizedBox.shrink()],
                    Padding(padding: EdgeInsets.only(left: titleSpacing ?? 0), child: Text(title ?? '', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600, fontSize: 20))),
                    const SizedBox(height: 5),
                    const Divider(color: Color.fromARGB(255, 238, 238, 238)),
                    if (description != null) ...[
                      const SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          description.toString(),
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 14, color: const Color(0xFF909090)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    if (customWidget != null) ...[const SizedBox(height: 10), customWidget ?? const SizedBox.shrink()],
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          if (timerDelay != null)
                            Expanded(
                              child: FutureBuilder(
                                future: enableYesButton,
                                builder: (context, snapshot) {
                                  return Stack(
                                    children: [
                                      CustomButton(
                                        width: isDesktop ? 190 : null,
                                        height: 45,
                                        text: firstButtonText ?? "Yes",
                                        color: snapshot.data == true ? const Color(0xFFC4283C) : Colors.grey.withOpacity(.5),
                                        textColor: Colors.white,
                                        border: const Border(),
                                        borderRadius: BorderRadius.circular(14),
                                        onTap: () {
                                          if (snapshot.data == true) {
                                            Navigator.of(context).pop();
                                            firstButtonTap!();
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
                                              color: snapshot.data == true ? Colors.white : const Color(0xFFC4283C),
                                              borderRadius: BorderRadius.circular(14),
                                            ),
                                            width: isDesktop
                                                ? width == null
                                                    ? MediaQuery.of(context).size.width * 0.13
                                                    : (width! - 150)
                                                : 100,
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
                          if (timerDelay == null)
                            if (hideButton != true)
                              Expanded(
                                child: CustomButton(
                                  isLoading: loading ?? false,
                                  width: firstButtonWidth ?? (isDesktop ? 190 : 125),
                                  height: 45,
                                  text: firstButtonText ?? "Yes",
                                  color: const Color(0xFFC4283C),
                                  textColor: Colors.white,
                                  border: const Border(),
                                  borderRadius: BorderRadius.circular(buttonRadius ?? 14),
                                  onTap: () => {Navigator.of(context).pop(), firstButtonTap!()},
                                ),
                              ),
                          if (secondButtonText?.isNotEmpty == true) ...[
                            const SizedBox(width: 15),
                            Expanded(
                              child: CustomButton(
                                isLoading: loading ?? false,
                                width: secondButtonWidth ?? (isDesktop ? (hideButton != true ? 185 : 350) : (hideButton != true ? 100 : MediaQuery.of(context).size.width / 1.65)),
                                height: 45,
                                text: secondButtonText ?? "Cancel",
                                color: const Color(0XFFFFF1F1),
                                textColor: const Color(0xFFC4283C),
                                border: const Border(),
                                borderRadius: BorderRadius.circular(buttonRadius ?? 14),
                                onTap: () => {Navigator.of(context).pop(), secondButtonTap!()},
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                if (height == null) const SizedBox(height: 20),
              ],
            ),
          ),
          if (hideCloseButton == true)
            Positioned(
              top: 16,
              right: 10,
              child: InkWell(
                borderRadius: BorderRadius.circular(100),
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0XFFFFF1F1)),
                  child: const Icon(Icons.close, size: 20, color: Color(0xFFC4283C)),
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

/// Enum representing the types of animations for the dialog.
///
/// The [AnimationType] enum allows you to specify how the dialog should animate
/// when it appears or disappears. This adds a dynamic feel to the user interface.
///
/// Possible values:
/// - [AnimationType.fade]: The dialog will fade in and out.
/// - [AnimationType.rotate]: The dialog will rotate in and out.
/// - [AnimationType.scale]: The dialog will scale in and out from the center.
/// - [AnimationType.slide]: The dialog will slide in and out from the specified direction.
/// - [AnimationType.size]: The dialog will change size during the animation.
/// - [AnimationType.switcher]: The dialog will use a switcher effect for transitions.
/// - [AnimationType.none]: No animation will be applied.
enum AnimationType { fade, rotate, scale, slide, size, switcher, none }
