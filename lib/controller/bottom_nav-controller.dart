import 'package:flutter/cupertino.dart';
import 'package:newshunter/view/category_screen/category_screen.dart';
import 'package:newshunter/view/home_screen/home_screen.dart';
import 'package:newshunter/view/search_screen/search_screen.dart';

class BottomNavController with ChangeNotifier{

  int selectedIndex = 0;

  void onItemTap(index){
    selectedIndex = index;
    notifyListeners();
  }

  List<Widget> myPages = [HomeScreen(), CategoryScreen(),SearchScreen()];
}