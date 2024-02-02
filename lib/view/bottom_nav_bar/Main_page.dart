import 'package:flutter/material.dart';
import 'package:newshunter/controller/bottom_nav-controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Provider.of<BottomNavController>(context).myPages[Provider.of<BottomNavController>(context).selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: Provider.of<BottomNavController>(context).selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.amber,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home", ),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search")
        ],
        onTap: Provider.of<BottomNavController>(context,listen: false).onItemTap,
      ),





    );

  }


}