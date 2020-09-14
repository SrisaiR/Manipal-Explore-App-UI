import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'MapPage.dart';
import 'SearchPage.dart';
import 'FavouritesPage.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  List<Widget> _screens;

  _goToNewScreen(int val) {
    setState(() {
      this._currentIndex = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _screens = [
      HomePage(
        goToNewScreen: _goToNewScreen,
      ),
      MapPage(),
      SearchPage(),
      FavouritesPage(),
    ];
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.deepPurple, Colors.blue],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _screens[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              gradient: LinearGradient(
                colors: [Colors.deepPurpleAccent, Colors.blueAccent],
              )),
          child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                title: Text("Home"),
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                title: Text("Map"),
                icon: Icon(Icons.location_on),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                title: Text("Search"),
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.transparent,
                title: Text("Favourites"),
                icon: Icon(Icons.favorite),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                this._currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
