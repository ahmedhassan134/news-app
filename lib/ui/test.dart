// import 'package:flutter/material.dart';
// import 'package:news_app/core/data_source/remote_data/api_services.dart';
// import 'package:news_app/core/utils/app_text_style.dart';
//
// import '../core/models/source_model.dart';
//
// class Test extends StatefulWidget {
//   const Test({super.key});
//
//   @override
//   State<Test> createState() => _TestState();
// }
//
// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//         appBar: AppBar(title: Text("data",style: TextStyle(color: Colors.white),),
//         ),
//       body: FutureBuilder<SourcesResponse>(
//           future: ApiServices().get(),
//           builder: (context, snapshot) {
//             if(snapshot.connectionState==ConnectionState.waiting){
//               return Center(child: CircularProgressIndicator(color: Colors.grey,),);
//             }
//             if (snapshot.hasError){
//               return Column(
//                 children: [
//                   Text("something is error "),
//                   ElevatedButton(onPressed: (){
//                     ApiServices().get();
//                     setState(() {
//
//                     });
//                   }, child: Text("Try Again"))
//                 ],
//               );
//             }
//             if(snapshot.data?.status=="error"){
//               return Column(
//                 children: [
//                   Text("something is error "),
//                   ElevatedButton(onPressed: (){
//                     ApiServices().get();
//                     setState(() {
//
//                     });
//
//                   }, child: Text("Try Again"))
//                 ],
//               );
//
//             }
//             else{
//               List<Source> sourceList=snapshot.data!.sources;
//               return ListView.builder(
//                 itemCount: sourceList.length,
//                   itemBuilder: (context, index) {
//                   return Text(sourceList[index].name,style: AppTextStyle.medium24white,);
//
//                   },
//               );
//             }
//           },
//
//       ),
//     );
//   }
// }
