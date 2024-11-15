import 'package:flutter/material.dart';
import 'package:smart_popup/smart_popup.dart';
import 'package:smart_popup/src/helper.dart';

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
  final PopType? popType;
  final Color? primaryButtonColor;

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
    final buttonColor = isLoading == true ? LottieAssetHelper.getPrimaryButtonColor(popType, primaryButtonColor) : color ?? Colors.white;
    final resolvedTextColor = textColor ?? smartTextColor(context, buttonColor);
    return InkWell(
      focusNode: focusNode ?? FocusNode(),
      borderRadius: BorderRadius.circular(12),
      onTap: isLoading == true ? null : onTap,
      onLongPress: isLoading == true ? null : onLongPress,
      mouseCursor: mouseCursor ?? SystemMouseCursors.click,
      child: Container(
        width: width,
        height: height ?? 45,
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
