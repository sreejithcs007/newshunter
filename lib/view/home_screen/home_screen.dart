import 'package:flutter/material.dart';
import 'package:newshunter/controller/home_screen-Controler.dart';
import 'package:newshunter/view/search_screen/search_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    super.initState();
    fetchData();

  }
  void fetchData() async{
    Provider.of<HomeScreenController>(context,listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("NEWS TODAY 📰",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold), ),
        actions: [
          IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen())), icon: Icon(Icons.search))
        ],
      ),
      body: Provider.of<HomeScreenController>(context).isLoading  == true ?

          Center(
            child: CircularProgressIndicator(),
          )
          :
          ListView.separated(itemBuilder: (context,index) => NewsCard(
            title: provider.newsModel.articles?[index].title
                .toString() ?? "",
            description: provider
                .newsModel.articles?[index].description
                .toString() ??
                "",
            date: provider.newsModel.articles?[index].publishedAt,
            imageUrl: provider.newsModel.articles?[index].urlToImage
                .toString() ??
                "",
            contant: provider.newsModel.articles?[index].content
                .toString() ??
                "",
            sourceName: provider
                .newsModel.articles?[index].source?.name
                .toString() ??
                "",
            url: provider.newsModel.articles?[index].url
                .toString() ??
                "",
          ),

              separatorBuilder: (context,index)=>Divider(height: 20,), itemCount: provider.newsModel.articles?.length ?? 0)

    );
  }


}
