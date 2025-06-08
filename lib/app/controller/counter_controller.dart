import 'package:flutter/material.dart';

class CounterController {
  static List<ValueNotifier<int>> count = [
    ValueNotifier(0),
    ValueNotifier(0),
    ValueNotifier(0),
    ValueNotifier(0),
    ValueNotifier(0),
  ];
}
