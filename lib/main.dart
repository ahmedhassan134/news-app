import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_app/core/utils/app_routes.dart';

import 'package:news_app/ui/home_screen/category/general/general_screen.dart';
import 'package:news_app/ui/home_screen/home_screen.dart';
import 'package:news_app/ui/home_screen/serch/search_screen.dart';
import 'package:news_app/ui/sport_screen.dart';
import 'package:news_app/ui/test.dart';
import 'package:provider/provider.dart';

import 'core/providers/language_provider.dart';
import 'core/providers/theme_provider.dart';
import 'core/utils/app_theme.dart';
import 'l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LanguageProvider()),
        ChangeNotifierProvider(create: (context)=>ThemeProvider()),
      ],

      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider=Provider.of<LanguageProvider>(context);
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    return MaterialApp(debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.appLanguage),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeApp,
      initialRoute: AppRoutes.homeScreen,
      // home: Test(),

      routes: {
      AppRoutes.homeScreen:(_)=>HomeScreen(),
      AppRoutes.generalScreen:(_)=>General(),
      AppRoutes.sportScreen:(_)=>SportScreen(),
      AppRoutes.searchScreen:(_)=>SearchScreen(),
      },

    );
  }
}

