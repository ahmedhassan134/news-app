import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/remote_data/api_services.dart';
import 'package:news_app/core/models/every_thing.dart';

import 'package:news_app/ui/home_screen/category/general/widgets/show_item.dart';

import '../../../../core/models/source_model.dart';
import '../../../../core/utils/size_config.dart';
import '../../widgets/appbar_home_widget.dart';
import '../news/widgets/custom_news_widget.dart';


class General extends StatefulWidget {
  const General({super.key});

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  @override
  Widget build(BuildContext context) {
    var category=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(

      // backgroundColor: Colors.red,
      appBar:AppbarHomeWidget(

        text:category ,
        onPressed: (){
          
        },
      ),
      body: FutureBuilder<SourcesResponse>(
        future: ApiServices().get(category: category),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(color: Colors.grey,),);
          }
          if (snapshot.hasError){
            return Column(
              children: [
                Text("something is error "),
                ElevatedButton(onPressed: (){
                  ApiServices().get(category: category);
                  setState(() {

                  });
                }, child: Text("Try Again"))
              ],
            );
          }
          if(snapshot.data?.status=="error"){
            return Column(
              children: [
                Text("something is error "),
                ElevatedButton(onPressed: (){
                  ApiServices().get(category: category);
                  setState(() {

                  });

                }, child: Text("Try Again"))
              ],
            );

          }
          else{
            List<Source> sourceList=snapshot.data!.sources;
            return   ShowItem(

              sourcList:sourceList ,
            );
          }
        },

      ),
    );
  }

  
}





