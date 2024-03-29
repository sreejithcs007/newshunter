import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/news_model.dart';

class  HomeScreenController with ChangeNotifier{

  late NewsDataModel newsModel;
  bool isLoading = false;

  fetchData() async{
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=310d551a405145728ac17cadf304e6bf");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String,dynamic> decodedData = {};
    if(response.statusCode == 200){
      decodedData = jsonDecode(response.body);
    }
    else{
      print("Api failed");
    }
    newsModel = NewsDataModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1,mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1,mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }

  void shareText({String textToShare = ""}){
    try{
      Share.share(textToShare);
    }catch(e){
      print(e);
    }
    notifyListeners();
  }


}