import 'package:news_app/core/utils/app_assets.dart';
import 'package:news_app/l10n/app_localizations.dart';

class HomeModel {
  final String image;
  final String text;
  final String categoryId;
  final bool isRight;
  HomeModel({
    required this.image,
    required this.text,
    this.isRight=true,
    required this.categoryId
});


}