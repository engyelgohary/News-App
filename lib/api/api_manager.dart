// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/model/NewResponse.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManger {
    static Future<SourceResponse?> getSources(String sourceid) async {
      Uri url = Uri.https(apiConstant.baseURL,apiConstant.sourcesApi,
      {
        'apiKey':'aac4c5c7500f40569ec20155c46ed6d3',
        'category': sourceid
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
     static Future<NewResponse?> getNewsbyId(String newId) async {
      Uri url = Uri.https(apiConstant.baseURL,apiConstant.newsApi,
      {
        'apiKey':'aac4c5c7500f40569ec20155c46ed6d3',
        'sources':newId
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