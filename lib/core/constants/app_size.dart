import 'package:flutter/material.dart';

class Appsizes {
  static double paddingSmall(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.02; // 2% of screen width
  static double paddingMedium(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.04; // 4% of screen width
  static double paddingLarge(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.1; // 6% of screen width

  static double borderRadius(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.03; // 3% of screen width
  static double iconSize(BuildContext context) =>
      MediaQuery.of(context).size.width * 0.08; // 8% of screen width
}
