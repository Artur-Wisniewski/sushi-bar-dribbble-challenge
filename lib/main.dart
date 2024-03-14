import 'package:device_preview/device_preview.dart';
import 'package:dribbble_sushi_bar_challenge/starter_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (BuildContext context) => const StarterApp(),
  ));
}
