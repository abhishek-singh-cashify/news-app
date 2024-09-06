import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/common/theme_mode_provider.dart';
import 'package:news_app/modules/home/screens/home_screen.dart';
import 'package:news_app/modules/news_description/screens/news_description_screen.dart';
import 'package:news_app/modules/splash/splash_screen.dart';
import 'package:provider/provider.dart';

import 'common/screens/no_page_found_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeModeProvider>(
      create: (_) => ThemeModeProvider(),
      lazy: false,
      builder: (BuildContext insideContext, __) {
        var provider = ThemeModeProvider.of(insideContext);
        return MaterialApp(
          title: 'Flutter Demo',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
          ],
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: provider.mode,
          initialRoute: SplashScreen.route,
          routes: {
            SplashScreen.route: (_) => const SplashScreen(),
            HomeScreen.route: (_) => const HomeScreen(),
            NewsDescriptionScreen.route: (_) => const NewsDescriptionScreen(),
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) {
                return const NoPageFoundScreen();
              },
              settings: settings,
            );
          },
        );
      },
    );
  }
}
