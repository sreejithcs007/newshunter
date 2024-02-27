import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../controller/search_screen-controller.dart';
import '../widgets/news_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
    Provider.of<SearchScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor:  Color(0xFFE0F4FF),
        bottom: PreferredSize(preferredSize: Size(100, 10), child: Container(
          width: MediaQuery.of(context).size.width,

          child: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 55,
                width: MediaQuery.sizeOf(context).width ,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10,top: 8),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        hintText: "Search for news",
                        suffixIcon: IconButton(onPressed: () {
                          provider.searchData(
                              searchtext: textController.text.toLowerCase());
                        },
                        icon:
                         Icon(Icons.search)),
                        hintStyle: GoogleFonts.poppins(color: Colors.grey,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color(0xff6A3DE8), )),
                      ),
                    ),
                  ),

              ),
              // const SizedBox(
              //   height: 20,
              //),
              // Expanded(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       provider.searchData(
              //           searchtext: textController.text.toLowerCase());
              //       FocusManager.instance.primaryFocus?.unfocus();
              //     },
              //     child: Text(
              //       "Search",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     style: ButtonStyle(
              //         backgroundColor:
              //         MaterialStatePropertyAll(Color(0xff6A3DE8))),
              //   ),
              // )
            ],
          ),
          ]
        )
        ),
      ),
    ),

      body: Container(
        color: Color(0xFFE0F4FF),
        child:
        Provider.of<SearchScreenController>(context).isLoading ==
            true
            ? Center(
            child: LottieBuilder.asset(
              "assets/animations/Animation - 1702395258490 (2).json",
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ))
            : ListView.separated(
            itemBuilder: (context, index) => NewsCard(
                title:
                provider.newsDataModel?.articles?[index].title ?? "",
                description:
                provider.newsDataModel?.articles?[index].description ??
                    "",
                date:
                provider.newsDataModel?.articles?[index].publishedAt,
                imageUrl:
                provider.newsDataModel?.articles?[index].urlToImage ??
                    "",
                contant: provider.newsDataModel?.articles?[index].content ??
                    "",
                sourceName:
                provider.newsDataModel?.articles?[index].source?.name ??
                    "",
                url: provider.newsDataModel?.articles?[index].url ?? ""),
            separatorBuilder: (context, index) => const Divider(height: 20),
            itemCount: provider.newsDataModel?.articles?.length ?? 0),
      ),

    );
  }
}