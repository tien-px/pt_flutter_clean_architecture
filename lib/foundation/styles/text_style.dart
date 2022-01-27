import 'package:flutter/material.dart';
import 'package:pt_clean_architecture/assets/fonts/fonts.dart';
import 'package:pt_flutter_architecture/pt_flutter_architecture.dart';

extension BaseTextExtension on Text {
  Text defaultStyle() {
    return this.setFontFamily(FontFamily.roboto).setFontSize(14);
  }
}
