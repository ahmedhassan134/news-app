import 'package:flutter/material.dart';
import 'package:news_app/core/providers/theme_provider.dart';
import 'package:news_app/core/utils/app_routes.dart';
import 'package:news_app/ui/sport_screen.dart';
import 'package:provider/provider.dart';

import '../../../core/models/home_model.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/size_config.dart';
import '../../../l10n/app_localizations.dart';

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {


  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    SizeConfig.init(context);
    List<HomeModel> nameList = [
      HomeModel(
        image: AppAssets.home_general,
        text: AppLocalizations.of(context)!.general,
        categoryId: "general"
      ),
      HomeModel(
        image: AppAssets.home_busines,
        text: AppLocalizations.of(context)!.business,
        isRight: false,
          categoryId: "business"
      ),
      HomeModel(
        image: AppAssets.home_sports,
        text: AppLocalizations.of(context)!.sports,
          categoryId: "sports"
      ),
      HomeModel(
        image: AppAssets.home_electronics,
        text: AppLocalizations.of(context)!.technology,
          isRight: false,
          categoryId: "technology"

      ),
      HomeModel(
        image: AppAssets.home_food,
        text: AppLocalizations.of(context)!.entertainment,
          categoryId: "entertainment"
      ),
      HomeModel(
        image: AppAssets.home_medicine,
        text: AppLocalizations.of(context)!.health,
          isRight: false,
          categoryId: "health"
      ),
      HomeModel(
        image: AppAssets.home_science,
        text: AppLocalizations.of(context)!.science,
          categoryId: "science"
      ),
    ];

    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: (){
          Navigator.of(context).pushNamed(AppRoutes.generalScreen,
            arguments: nameList[index].categoryId
              );
        },
        child: Container(
          padding: EdgeInsets.all(20),
          alignment:nameList[index].isRight? .topRight:.topLeft,

          height: SizeConfig.screenHeight * .3,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(nameList[index].image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: .spaceBetween,


            children: [
              Text(nameList[index].text,style: Theme.of(context).textTheme.titleLarge,
            ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start:nameList[index].isRight? SizeConfig.screenHeight*.01:0,
                  end:nameList[index].isRight?0 :SizeConfig.screenHeight*.01,

                ),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey
                ),
                child:nameList[index].isRight? Row(
                 spacing: 10,
                  mainAxisSize: .min,
                  children: [
                    Text(AppLocalizations.of(context)!.view_all,style: Theme.of(context).textTheme.titleSmall,),
                    CircleAvatar(
                      backgroundColor: themeProvider.isDark?Colors.white:Colors.black,
                      child: Icon(Icons.arrow_forward_ios_outlined,color: Theme.of(context).cardColor,),
                    )


                  ],
                ):Row(
                  spacing: 10,
                  mainAxisSize: .min,
                  children: [
                    CircleAvatar(
                      backgroundColor: themeProvider.isDark?Colors.white:Colors.black,
                      child: Icon(Icons.arrow_back_ios_rounded,color: Theme.of(context).cardColor,),
                    ),
                    Text(AppLocalizations.of(context)!.view_all,style: Theme.of(context).textTheme.titleSmall,),



                  ],
                ),
              ),




            ],
          ),
        ),
      ),

      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemCount: nameList.length,
    );
  }
  Widget profileItem({
    required String text,
    required Widget child,
    required TextStyle style,
    required Color color,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      // title: Text(text, style: style),
      trailing: IconButton(
        onPressed: () {
         //todo: do thing
        },
        icon: child,
      ),
    );
  }
}
