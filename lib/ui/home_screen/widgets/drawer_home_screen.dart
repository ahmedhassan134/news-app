import 'package:flutter/material.dart';
import 'package:news_app/core/providers/language_provider.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/app_colors.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/core/utils/app_text_style.dart';
import 'package:news_app/core/utils/size_config.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';
import '../../../l10n/app_localizations.dart';
import 'drop_down_button.dart';

class DrawerHomeScreen extends StatefulWidget {
  const DrawerHomeScreen({super.key});

  @override
  State<DrawerHomeScreen> createState() => _DrawerHomeScreenState();
}

class _DrawerHomeScreenState extends State<DrawerHomeScreen> {
  ThemeMode themeData = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Drawer(
      backgroundColor: Colors.black,

      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * .2,
            decoration: BoxDecoration(color: Colors.white),
            alignment: .center,
            child: Text(
              AppLocalizations.of(context)!.new_app,
              style: AppTextStyle.bold24black,
            ),
          ),
          Container(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: SizeConfig.screenHeight * .04,
              horizontal: SizeConfig.screenWidth * .04,
            ),

            child: Column(
              spacing: SizeConfig.screenHeight * .02,
              children: [
                RowWidget(
                  text: AppLocalizations.of(context)!.go_to_home,
                  iconImage: AppIcon.icon_home,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
                  },
                ),
                Divider(thickness: 2),
                RowWidget(
                  text: AppLocalizations.of(context)!.theme,
                  iconImage: AppIcon.icon_theme,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.whiteColor, width: 2),
                  ),
                  child: DropdownButton<ThemeMode>(
                    value: themeProvider.themeApp,
                    dropdownColor: Colors.black,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: SizedBox(),
                    isExpanded: true,

                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(
                          AppLocalizations.of(context)!.light,
                          style: AppTextStyle.bold20white,
                        ),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(
                          AppLocalizations.of(context)!.dark,
                          style: AppTextStyle.bold20white,
                        ),
                      ),
                    ],

                    onChanged: (value) {
                      themeProvider.changeAppTheme(value!);
                    },
                  ),
                ),

                Divider(thickness: 2),
                RowWidget(
                  text: AppLocalizations.of(context)!.language,
                  iconImage: AppIcon.icon_language,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * .04,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.whiteColor, width: 2),
                  ),
                  child: DropdownButton<String>(
                    value: languageProvider.appLanguage,
                    // 👈 من provider
                    dropdownColor: Colors.black,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: SizedBox(),
                    isExpanded: true,

                    items: [
                      DropdownMenuItem(
                        value: "en",
                        child: Text(
                          AppLocalizations.of(context)!.english,
                          style: AppTextStyle.bold20white,
                        ),
                      ),
                      DropdownMenuItem(
                        value: "ar",
                        child: Text(
                          AppLocalizations.of(context)!.arabic,
                          style: AppTextStyle.bold20white,
                        ),
                      ),
                    ],

                    onChanged: (value) {
                      languageProvider.changeAppLanguage("$value");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget RowWidget({
    required String iconImage,
    required String text,
    Function()? onPressed,
  }) {
    return Row(
      spacing: 20,
      children: [
        Image.asset(iconImage),
        TextButton(
          onPressed: onPressed,
          child: Text(text, style: AppTextStyle.bold20white),
        ),
      ],
    );
  }

  void changeThemeApp() {
    ShowDropDownButtonWidget();
  }
}
