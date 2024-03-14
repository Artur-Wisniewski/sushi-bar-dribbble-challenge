import 'package:flutter/material.dart';

Future<void> loadImage({
  required BuildContext context,
  required String imageUrl,
}) async {
  await precacheImage(AssetImage(imageUrl), context);
}
