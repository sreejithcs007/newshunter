import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newshunter/controller/category_screen-controller.dart';
import 'package:provider/provider.dart';

import '../widgets/news_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async{
    Provider.of<CategoryController>(context,listen: false).fetchData();
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CategoryController>(context);
    return  DefaultTabController(length: provider.categoryList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("EXPLORE",style: GoogleFonts.blackOpsOne(fontSize: 25,fontWeight: FontWeight.bold),)),
            elevation: 1,
            backgroundColor: Color(0xFFE0F4FF),
            bottom: TabBar(
              indicatorColor: Colors.red,
                isScrollable: true,
                labelColor: Colors.black,
                tabs: List.generate(provider.categoryList.length, (index) => Tab(
              text: provider.categoryList[index],
            )),
            onTap: (value){
                provider.onTap(index: value);
          },),
          ),
          body: Container(
            color: Color(0xFFE0F4FF),
            child: Provider.of<CategoryController>(context).isLoading  == true ?

            Center(
              child: CircularProgressIndicator(),
            )
                :
            ListView.separated(itemBuilder: (context,index) => NewsCard(
              title: provider.newsDataModel.articles?[index].title
                  .toString() ?? "",
              description: provider
                  .newsDataModel.articles?[index].description
                  .toString() ??
                  "",
              date: provider.newsDataModel.articles?[index].publishedAt,
              imageUrl: provider.newsDataModel.articles?[index].urlToImage
                  .toString() ??
                  "",
              contant: provider.newsDataModel.articles?[index].content
                  .toString() ??
                  "",
              sourceName: provider
                  .newsDataModel.articles?[index].source?.name
                  .toString() ??
                  "",
              url: provider.newsDataModel.articles?[index].url
                  .toString() ??
                  "",
            ),

                separatorBuilder: (context,index)=>Divider(height: 20,), itemCount: provider.newsDataModel.articles?.length ?? 0),
          )
          ,
        )
        );
  }


}
