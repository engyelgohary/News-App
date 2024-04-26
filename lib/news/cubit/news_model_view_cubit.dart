import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/api/api_manager.dart';
import '../../model/NewResponse.dart';
part 'news_model_view_state.dart';

class NewsModelViewCubit extends Cubit<NewsModelViewState> {
  NewsModelViewCubit() : super(NewsLoadingState());
  void getNews(String newId) async {
    try {
        emit(NewsLoadingState());
      var response =await ApiManger.getNewsbyId(newId:newId);
      if(response!.status=='error'){
        emit(NewsErrorState(errorMessage: response.message!));
        return;
      }
      if(response.status == 'ok')
      {
        emit(NewsSuccessState(newsList: response.articles!));
        return;
      }
    } catch (e)
    {
        emit(NewsErrorState(errorMessage: '$e'));
    }
  }

}
