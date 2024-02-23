import 'package:flutter/material.dart';

Future<void> loadImage({
  required BuildContext context,
  required String imageUrl,
}) async {
  try {
    await precacheImage(AssetImage(imageUrl), context);
  } catch (e) {
    //TODO
  }
}
