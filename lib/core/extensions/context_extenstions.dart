import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  TextDirection get appTextDirection => Directionality.of(this);
}
