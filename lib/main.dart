import 'package:flutter/material.dart';
import 'package:newshunter/view/bottom_nav_bar/Main_page.dart';
import 'package:provider/provider.dart';
import 'controller/bottom_nav-controller.dart';
import 'controller/category_screen-controller.dart';
import 'controller/home_screen-Controler.dart';
import 'controller/search_screen-controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create : (context) => HomeScreenController(),
          ),
          ChangeNotifierProvider(
            create : (context) => SearchScreenController(),
          ),
          ChangeNotifierProvider(
            create : (context) => BottomNavController(),
          ),
          ChangeNotifierProvider(
            create : (context) => CategoryController(),
          )

    ],
      child:  MaterialApp(
        home: MainPage(),
        debugShowCheckedModeBanner: false,

      ),

    );
  }
}
