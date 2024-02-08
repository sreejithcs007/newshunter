import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newshunter/model/news_model.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {
   NewsDataModel? newsDataModel;
  bool isLoading = false;

  Future<void> searchData({required String searchtext})async {
    isLoading = true;
    final url =Uri.parse("https://newsapi.org/v2/everything?q=$searchtext&sortBy=popularity&apiKey=310d551a405145728ac17cadf304e6bf");

    notifyListeners();
    try{
      final response = await http.get(url,headers: {'Content-Type' : 'application/json'});

      if(response.statusCode == 200){
        final Map<String,dynamic> decodeddata = jsonDecode(response.body);
        newsDataModel = NewsDataModel.fromJson(decodeddata);
      }else{
        print("Api failed");
      }

    }catch(e){
      print(e);
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}
