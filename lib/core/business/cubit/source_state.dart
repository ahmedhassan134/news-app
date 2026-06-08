part of 'source_cubit.dart';

@immutable
sealed class SourceState {}

 class SourceInitial extends SourceState {}
 class SourceLoadingState extends SourceState {}
 class SourceSuccessState extends SourceState {
  List<Source> sourceList;
  SourceSuccessState(this.sourceList);

}
 class SourceFailureState extends SourceState {
  String messageError;
  SourceFailureState(this.messageError);
 }
