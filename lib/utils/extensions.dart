
import 'package:flutter/material.dart';

extension SeparatedWidgetList on List<Widget> {
  List<Widget> separated({required Widget separator}) {
    if (length < 2) return this;
    final List<Widget> separatedList = [];
    for (int i = 0; i < length; i++) {
      separatedList.add(this[i]);
      if (i != length - 1) {
        separatedList.add(separator);
      }
    }
    return separatedList;
  }
}
