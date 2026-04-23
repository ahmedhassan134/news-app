import 'package:flutter/material.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/core/utils/app_text_style.dart';

import '../../../../../core/utils/size_config.dart';

class TabItem extends StatelessWidget {
  TabItem({required this.isSelected, required this.source});

  final bool isSelected;
  final Source source;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Text(
      source.name ?? " ",
      style: isSelected
          ? Theme.of(context).textTheme.bodyMedium
          : Theme.of(context).textTheme.bodySmall
    );
  }
}
