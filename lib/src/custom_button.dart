import 'package:flutter/material.dart';

/// A customizable button widget for Flutter applications.
///
/// The [CustomButton] class provides a highly configurable button that can
/// display text, icons, or custom loading indicators. It supports tooltips,
/// various styles, and loading states, making it suitable for a wide range of
/// use cases in your application.
///
/// ## Features:
/// - **Customizable appearance:** Change colors, sizes, and borders.
/// - **Loading state:** Display a loading indicator when processing an action.
/// - **Tooltip support:** Add tooltips for additional context on hover.
/// - **Icon support:** Include icons alongside text for better visual representation.
///
/// ## Parameters:
/// - [text] : The text to display on the button.
/// - [icon] : An optional icon to display alongside the text.
/// - [onTap] : Callback function triggered on button tap.
/// - [onLongPress] : Callback function triggered on button long press.
/// - [width] : The width of the button.
/// - [height] : The height of the button.
/// - [textSize] : The size of the button text.
/// - [iconSize] : The size of the button icon.
/// - [borderRadius] : The border radius for rounded corners.
/// - [splashRadius] : The radius of the splash effect.
/// - [border] : A border for the button.
/// - [color] : The background color of the button.
/// - [iconColor] : The color of the icon.
/// - [textColor] : The color of the button text.
/// - [textStyle] : Additional styles for the button text.
/// - [fontWeight] : Font weight for the button text.
/// - [buttonText] : A custom widget for displaying text instead of the default.
/// - [iconWidget] : A custom widget for displaying an icon instead of the default.
/// - [focusNode] : A focus node to manage focus behavior.
/// - [tooltip] : Tooltip text to display on hover.
/// - [tooltipBackground] : Background color for the tooltip.
/// - [tooltipForeground] : Text color for the tooltip.
/// - [isLoading] : A flag to indicate if the button is in a loading state.
/// - [customLoading] : A custom widget to display during loading.
/// - [ellipsisOverFlow] : A flag to control text overflow behavior.
/// - [mouseCursor] : The mouse cursor to show on hover.
///
/// ## Usage:
/// To use the [CustomButton], simply create an instance and provide the
/// necessary parameters. You can customize the button appearance, set callbacks
/// for tap events, and display loading indicators as needed.
class CustomButton extends StatelessWidget {
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

  /// Creates a [CustomButton] widget.
  const CustomButton({
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
  });

  @override
  Widget build(BuildContext context) {
    return buttonWidget(context);
  }

  Color _getTextColor(BuildContext context, Color? buttonColor) {
    if (buttonColor == null) return Colors.black;
    final double luminance = buttonColor.computeLuminance();
    return luminance > 0.8 ? Colors.black : Colors.white;
  }

  Widget buttonWidget(BuildContext context) {
    final buttonColor = isLoading == true ? Colors.white : color ?? Colors.white;
    final resolvedTextColor = textColor ?? _getTextColor(context, buttonColor);
    return InkWell(
      focusNode: focusNode ?? FocusNode(),
      borderRadius: BorderRadius.circular(12),
      onTap: isLoading == true ? null : onTap,
      onLongPress: isLoading == true ? null : onLongPress,
      mouseCursor: mouseCursor ?? SystemMouseCursors.click,
      child: Container(
        width: width,
        height: height ?? 40,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
          border: isLoading == true ? null : border ?? const Border(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: isLoading == true
                ? [
                    customLoading ??
                        const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 3,
                            color: Color(0xFFC4283C),
                          ),
                        )
                  ]
                : [
                    if (iconWidget != null) iconWidget! else if (icon != null) Icon(icon, size: iconSize ?? 20, color: iconColor ?? resolvedTextColor),
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
                                    color: resolvedTextColor,
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
                                      color: resolvedTextColor,
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
