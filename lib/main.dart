import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/ui/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes: {
      AppRoutes.homeScreen:(_)=>HomeScreen()
      },

    );
  }
}

