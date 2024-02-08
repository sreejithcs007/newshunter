import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:newshunter/model/news_model.dart';
import 'package:http/http.dart' as http;

class CategoryController with ChangeNotifier{

  List<String> categoryList = ['Business','Entertainment','General','Health','Science','Sports','Technology'];
  
  String category = 'business';


 onTap({required int index}){
  category = categoryList[index].toLowerCase();
  fetchData();
  print(category);
  notifyListeners();
}



late NewsDataModel newsDataModel;
bool isLoading = false;

void fetchData() async {
  isLoading = true;
  final url = Uri.parse(
      "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=310d551a405145728ac17cadf304e6bf");
  print(category);

  final response = await http.get(url);
  print(response.statusCode);
  Map<String,dynamic> decodedData ={};

  if(response.statusCode == 200){
    decodedData = jsonDecode(response.body);
  }
  else{
    print("Api failed");
  }
  newsDataModel = NewsDataModel.fromJson(decodedData);
  isLoading = false;
  notifyListeners();
}
}