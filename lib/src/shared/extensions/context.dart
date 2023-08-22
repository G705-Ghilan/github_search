import 'package:flutter/material.dart';

extension BuildContextPlus on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  NavigatorState get nav => Navigator.of(this);

  EdgeInsets get padding => const EdgeInsets.all(10);
  BorderRadius get radius => BorderRadius.circular(10);
  RoundedRectangleBorder get shape =>
      RoundedRectangleBorder(borderRadius: radius);
}
