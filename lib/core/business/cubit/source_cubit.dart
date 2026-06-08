
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/data_source/remote_data/api_services.dart';
import 'package:news_app/core/models/source_model.dart';

part 'source_state.dart';

class SourceCubit extends Cubit<SourceState> {
  SourceCubit() : super(SourceInitial());

  void getNews({ required String category })async{

    try{
      emit(SourceLoadingState());
      var response=await ApiServices.get(category: category);
      if(response.status=="ok"){
        emit(SourceSuccessState(response.sources!));
      }
      else{
        emit(SourceFailureState("Error"));
      }
    }catch(e){
      emit(SourceFailureState(e.toString()));
    }
  }
}
