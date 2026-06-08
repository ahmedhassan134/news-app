import 'package:flutter/material.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/utils/app_assets.dart';
class BodyWidgetItem extends StatelessWidget {
  const BodyWidgetItem({required this.source});
final Source source;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Image.asset(AppAssets.home_busines,fit: BoxFit.cover,)
          
        ],
      ),
    );
  }
}
