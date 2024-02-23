import 'package:dribbble_sushi_bar_challenge/core/constants/images_paths.dart';
import 'package:dribbble_sushi_bar_challenge/setup/routes.dart';
import 'package:dribbble_sushi_bar_challenge/translations/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';

import 'core/styles/theme.dart';

class StarterApp extends StatefulWidget {
  const StarterApp({super.key});

  @override
  State<StarterApp> createState() => _StarterAppState();
}

class _StarterAppState extends State<StarterApp> {
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(ImagePaths.wavesBackground), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        L10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: onGenerateRoute,
      initialRoute: Routes.start,
      supportedLocales: L10n.delegate.supportedLocales,
    );
  }
}
