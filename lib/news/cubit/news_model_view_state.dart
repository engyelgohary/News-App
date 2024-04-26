part of 'news_model_view_cubit.dart';

@immutable
sealed class NewsModelViewState {}
final class NewsLoadingState extends NewsModelViewState {}
final class NewsErrorState extends NewsModelViewState {
  String errorMessage;
  NewsErrorState({required this.errorMessage});
}
final class NewsSuccessState extends NewsModelViewState {
  List<News> newsList;
  NewsSuccessState({required this.newsList});
}

