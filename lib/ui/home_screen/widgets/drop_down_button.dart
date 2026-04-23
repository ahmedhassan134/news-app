

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/providers/theme_provider.dart';
import '../../../l10n/app_localizations.dart';
class ShowDropDownButtonWidget extends StatefulWidget {
  const ShowDropDownButtonWidget({super.key});

  @override
  State<ShowDropDownButtonWidget> createState() => _ShowDropDownButtonWidgetState();
}

class _ShowDropDownButtonWidgetState extends State<ShowDropDownButtonWidget> {

  ThemeMode themeData=ThemeMode.light;
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =Provider.of<ThemeProvider>(context);
    return Center(
      child: DropdownButton(

        value: themeData,
        items: [
          DropdownMenuItem(
            onTap: (){
              themeProvider.changeAppTheme(ThemeMode.light);
            },
            value: ThemeMode.light,
            child:Text(AppLocalizations.of(context)!.light),
          ),
          DropdownMenuItem(
            onTap: (){
              themeProvider.changeAppTheme(ThemeMode.dark);
            },
            value: ThemeMode.dark,
            child:Text(AppLocalizations.of(context)!.dark),
          ),

        ],
        onChanged: (value) {
          setState(() {
            themeData = value!;
          });
        },
      ),
    );

  }
}
