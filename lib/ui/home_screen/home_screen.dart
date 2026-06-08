import 'package:flutter/material.dart';


import 'package:news_app/core/utils/size_config.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/ui/home_screen/widgets/appbar_home_widget.dart';
import 'package:news_app/ui/home_screen/widgets/body_widget.dart';
import 'package:news_app/ui/home_screen/widgets/drawer_home_screen.dart';
import 'package:provider/provider.dart';


import '../../core/providers/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    SizeConfig.init(context);
    return Scaffold(
      drawer: DrawerHomeScreen(),
      appBar: AppbarHomeWidget(text: AppLocalizations.of(context)!.home,),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenHeight * .02,
          horizontal: SizeConfig.screenHeight * .02,
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              AppLocalizations.of(context)!.good_morning,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Expanded(
              child: BodyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
