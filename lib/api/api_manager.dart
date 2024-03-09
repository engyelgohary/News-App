import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/api_constant.dart';
import 'package:news/model/SourceResponse.dart';

class ApiManger {
    static Future<SourceResponse?> getSources() async {
      Uri url = Uri.https(apiConstant.baseURL,apiConstant.sourcesApi,
      {
        'apiKey':'aac4c5c7500f40569ec20155c46ed6d3'
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
}