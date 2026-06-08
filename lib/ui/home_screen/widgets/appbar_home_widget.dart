import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_routes.dart';

import '../../../l10n/app_localizations.dart';

class AppbarHomeWidget extends StatelessWidget implements PreferredSizeWidget {
   AppbarHomeWidget({ required this.text,this.onPressed});
final String text;
   void Function()? onPressed;
  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      actions: [
        IconButton(onPressed: (){
          Navigator.of(context).pushNamed(AppRoutes.searchScreen);
        }, icon: Icon(Icons.search, size: 24)),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
