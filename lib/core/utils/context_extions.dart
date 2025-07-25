import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // style
  TextStyle get textStyle => Theme.of(this).textTheme.displaySmall!;
}
