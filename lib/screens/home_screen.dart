import 'package:flutter/material.dart';
import 'package:threads/screens/favourite_screen.dart';
import 'package:threads/screens/new_post_screen.dart';
import 'package:threads/screens/proflie_screen.dart';
import 'package:threads/screens/search_screen.dart';
import 'package:threads/screens/time_line_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;
   List listOfScreen= [
     TimeLine(),
     SearchScreen(),
     PostingScreen(),
     FavouriteScreen(),
     ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: listOfScreen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade300,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: '',
          ),
        ],
      ),
    );
  }
}
