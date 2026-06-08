import 'package:flutter/material.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/ui/home_screen/category/general/widgets/tab_item.dart';
import 'package:provider/provider.dart';

import '../../../../../core/providers/language_provider.dart';
import '../../../../../core/providers/theme_provider.dart';

import '../../../../../core/utils/size_config.dart';
import '../../../widgets/body_widget.dart';
import '../../news/widgets/news_widget_show.dart';
import 'body_widget.dart';

class ShowItem extends StatefulWidget {
  ShowItem({required this.sourcList});
final List<Source> sourcList ;
  @override
  State<ShowItem> createState() => _HomeState();
}

class _HomeState extends State<ShowItem> {
  int cIndex = 0;


  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    SizeConfig.init(context);
    return DefaultTabController(
      length: widget.sourcList.length,
      child: Column(
        children: [
          TabBar(
            tabs: widget.sourcList
                .map(
                  (e) => TabItem(
                    source: e,
                    isSelected: cIndex == widget.sourcList.indexOf(e),
                  ),
                )
                .toList(),
            isScrollable: true,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white,
            tabAlignment: TabAlignment.start,
            onTap: (value) {
              cIndex = value;
              setState(() {});
            },
          ),

          Expanded(child: NewsWidgetShow(
            source: widget.sourcList[cIndex],
          ))
        ],
      ),

    );
  }
}


