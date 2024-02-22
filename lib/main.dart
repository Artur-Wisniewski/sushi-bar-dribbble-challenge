import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/starter_app.dart';
import 'package:flutter/material.dart';

void main() {
  final image = AssetImage(ImagePaths.wavesBackground);
  runApp( StarterApp(image: image));
}