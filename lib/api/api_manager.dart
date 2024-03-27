// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/model/NewResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManger {
    static Future<SourceResponse?> getSources(String sourceid,String language) async {
      Uri url = Uri.https(ApiConstant.baseURL,ApiConstant.sourcesApi,
      {
        'apiKey':'aac4c5c7500f40569ec20155c46ed6d3',
        'category': sourceid,
        'language':language
      });
      try{
           var response = await http.get(url);
    var responsebody = response.body;
    var json = jsonDecode(responsebody);
    return SourceResponse.fromJson(json);
      }catch(e){
        throw e;
      }
 
    }
     static Future<NewResponse?> getNewsbyId({String?newId,String? searchKeyword}) async {
      Uri url = Uri.https(ApiConstant.baseURL,ApiConstant.newsApi,
      {
        'apiKey':'aac4c5c7500f40569ec20155c46ed6d3',
        'sources':newId,
        'q': searchKeyword,
      });
      try{
     var response = await http.get(url);
    var responsebody = response.body;
    var json = jsonDecode(responsebody);
    return NewResponse.fromJson(json);
      }catch(e){
        throw e;
      }
 
    }
}