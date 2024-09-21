import 'package:flutter/material.dart';

/// A utility class for responsive design in Flutter applications.
///
/// The [ResponsiveHelper] class provides static methods to determine
/// the type of device (mobile, tablet, or desktop) based on the width
/// of the screen. These methods can be used to apply different styles
/// or layouts depending on the screen size.
///
/// ## Methods:
/// - `isMobile(BuildContext context)`: Returns true if the device is a mobile
///   device (screen width < 600 pixels).
/// - `isTablet(BuildContext context)`: Returns true if the device is a tablet
///   (screen width between 600 and 1024 pixels).
/// - `isDesktop(BuildContext context)`: Returns true if the device is a desktop
///   (screen width >= 1024 pixels).
class ResponsiveHelper {
  //* Functions to check & breakpoints checking for different screen sizes (Mobile, Tablet, Desktop)

  /// Checks if the current device is a mobile device.
  ///
  /// Returns true if the screen width is less than 600 pixels.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  /// Checks if the current device is a tablet.
  ///
  /// Returns true if the screen width is between 600 and 1024 pixels.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  /// Checks if the current device is a desktop.
  ///
  /// Returns true if the screen width is 1024 pixels or more.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
}
