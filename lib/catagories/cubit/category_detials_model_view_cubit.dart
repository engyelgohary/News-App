import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/SourceResponse.dart';
part 'category_detials_model_view_state.dart';

class CategoryDetialsModelViewCubit extends Cubit<CategoryDetialsModelViewState> {
  CategoryDetialsModelViewCubit() : super(LoadingState());
  void getSources(String sourceId) async {
    try{
      emit(LoadingState());
     var response = await ApiManger.getSources(sourceId);
     if(response!.status == "error"){
       emit(ErrorState(errorMessage: response.message!));
     return;
     }
     if(response.status == "ok")
     {
       emit(SuccessState(sourcesList: response.sources!));
     return;
     }
    }catch(e){
        emit(ErrorState(errorMessage: "$e"));
    }
  }
}
