import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/remote_data/api_services.dart';
import 'package:news_app/core/utils/size_config.dart';
import 'package:news_app/ui/home_screen/serch/widgets/text_field.dart';

import '../../../core/models/every_thing.dart';
import '../../../core/utils/app_colors.dart';
import '../category/news/widgets/custom_news_widget.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Future<NewsResponse>? futureNews;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: SizeConfig.screenHeight*.02,),

            TextFieldWidget(
              onTap:(String ? text){

                setState(() {

                  futureNews=ApiServices().getNewsBySearch(searchNews: text);
                });
              } ,
            ),
            Expanded(
              child: FutureBuilder<NewsResponse>(
                future: futureNews,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.grey),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Column(
                        children: [
                          Text("something is error "),
                          ElevatedButton(
                            onPressed: () {
                              ApiServices().getNewsBySearch(

                              );
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
                        children: [
                          Text("something is error "),
                          ElevatedButton(
                            onPressed: () {
                              ApiServices().getNewsBySearch(

                              );
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
                      ? Center(child: Text("not item is searched about yet"))
                      : ListView.separated(
                          separatorBuilder: (context, index) =>
                              SizedBox(height: SizeConfig.screenHeight * .01),
                          itemCount: newsList.length,
                          itemBuilder: (context, index) {
                            return CustomNewsWidget( article: newsList[index],);
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
