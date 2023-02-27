import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../model/model.dart';

class ApiProvider{
  final Dio _dio = Dio();
  final String _url = 'https://jsonplaceholder.typicode.com/posts';

  Future<PostResponseModel> fetchList() async{
    try{
      Response response = await _dio.get(_url);

      return PostResponseModel.fromJson(response.data);
    }catch(error,stacktrace){
      if(kDebugMode){
        print('Exception: $error, StackTrace: $stacktrace' );
      }
      return PostResponseModel.withError('Data Not Found OR Connection issues');
    }
  }
}

// List<Word> temp = (jsonMap['data'] as List).map((itemWord) => Word.fromJson(itemWord)).toList();