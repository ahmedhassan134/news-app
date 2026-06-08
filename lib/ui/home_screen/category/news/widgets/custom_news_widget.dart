import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/models/every_thing.dart';
import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/core/utils/size_config.dart';
class CustomNewsWidget extends StatelessWidget {
  const CustomNewsWidget({required this.article});
final Article article;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Container(
      margin: EdgeInsets.only(
        top: SizeConfig.screenHeight*.02,
        // vertical: SizeConfig.screenHeight*.02,
        left: SizeConfig.screenHeight*.02,
        right: SizeConfig.screenHeight*.02,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).cardColor,
          width: 2
        )
      ),child: Column(
      spacing: SizeConfig.screenHeight*.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16) ,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage??AppAssets.home_food,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(article.title??" "),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Text("By: ${article.author??" "}"),
            trailing: Text(
              "${article.publishedAt?.minute ?? 0} minute ago",
            ),
          )

      ],
    ),
    );
  }
}
