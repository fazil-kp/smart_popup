import 'package:flutter/material.dart';

class ResponsiveHelper {
  //* Functions to check & breakpoints checking for for different screens sizes (Mobile, Tablet, Desktop)
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;
}
