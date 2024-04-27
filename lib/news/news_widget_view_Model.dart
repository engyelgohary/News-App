import 'package:flutter/cupertino.dart';
import 'package:news/api/api_manager.dart';
import '../model/NewResponse.dart';
class NewsDetailsViewModel extends ChangeNotifier{
  List<News>?newsList;
  String?errorMessage;

  void getNews(String newId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManger.getNewsbyId(newId: newId);
      if(response!.status == 'error'){
        errorMessage = response.message;
      } else{
        newsList = response.articles;
      }
    }catch(e){
      errorMessage = "$e";
    }
    notifyListeners();
  }
}