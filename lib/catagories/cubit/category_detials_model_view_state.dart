part of 'category_detials_model_view_cubit.dart';

@immutable
sealed class CategoryDetialsModelViewState {}

final class LoadingState extends CategoryDetialsModelViewState{}

final class SuccessState extends CategoryDetialsModelViewState{
  List<Source> newsList;
  SuccessState({required this.newsList});
}

final class ErrorState extends CategoryDetialsModelViewState{
  String errorMessage;
  ErrorState({required this.errorMessage});
}
