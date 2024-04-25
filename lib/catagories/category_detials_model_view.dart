import 'package:flutter/foundation.dart';
import 'package:news/api/api_manager.dart';

import '../model/SourceResponse.dart';

class CategoryDetialsModelView extends ChangeNotifier{
  //hold data- handle logic
  List<Source>? listSource;
  String?errorMessage;

  void getSource(String sourceId)async{
    listSource = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManger.getSources(sourceId);
      if(response!.status == 'error'){
        errorMessage = response.message;
      } else {
        listSource = response.sources;
      }
    }catch(e){
        errorMessage = "$e";
    }
    notifyListeners();
  }
}