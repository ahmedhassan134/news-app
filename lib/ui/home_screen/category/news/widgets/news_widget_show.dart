import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/remote_data/api_services.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/size_config.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/models/every_thing.dart';
import '../../../../../core/utils/app_colors.dart';
import 'custom_news_widget.dart';

class NewsWidgetShow extends StatefulWidget {
  const NewsWidgetShow({required this.source});

  final Source source;

  @override
  State<NewsWidgetShow> createState() => _NewsWidgetShowState();
}

class _NewsWidgetShowState extends State<NewsWidgetShow> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return FutureBuilder(
      future: ApiServices().getNewsById(sourceId: widget.source.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.grey));
        } else if (snapshot.hasError) {

          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("something is error "),
                ElevatedButton(
                  onPressed: () {
                    ApiServices().getNewsById(sourceId: widget.source.id);
                    setState(() {});
                  },
                  child: Text("Try Again"),
                ),
              ],
            ),
          );
        } else if (snapshot.data?.status == "error") {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("something is error "),
                ElevatedButton(
                  onPressed: () {
                    ApiServices().getNewsById(sourceId: widget.source.id);
                    setState(() {});
                  },
                  child: Text("Try Again"),
                ),
              ],
            ),
          );
        }
          List<Article> newsList = snapshot.data?.articles ?? [];
          return newsList.isEmpty
              ? Center(child: Text("not found any thing"))
              : ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(height: SizeConfig.screenHeight * .01),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        showBottomSheetMethod(article: newsList[index]);
                      },
                      child: CustomNewsWidget(article: newsList[index]),
                    );
                  },
                );

      },
    );
  }

  void showBottomSheetMethod({required Article article}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Theme.of(context).cardColor, width: 2),
          ),
          child: Column(
            mainAxisSize: .min,
            spacing: SizeConfig.screenHeight * .01,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? AppAssets.home_food,
                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Text(article.description ?? " "),

              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(article.url??"");


                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                  minimumSize: const Size.fromHeight(56),
                ),
                child: Text(
                  AppLocalizations.of(context)!.view_full_articles,
                  style: TextStyle(fontSize: 16, fontWeight: .w400),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
