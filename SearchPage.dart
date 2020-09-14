import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'CustomExpansionTile.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                  ),
                  child: Text(
                    "Explore",
                    style: GoogleFonts.ibmPlexSans(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                  child: Text(
                    "Categories you may be interested in!",
                    style: GoogleFonts.ibmPlexSans(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            CategoryExpansionTile(
              title: "Campus Points",
              color: Colors.deepOrange[300],
              children: <Widget>[
                ChildOfCategoryTile(
                  title: "Student Plaza",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "AB-2",
                  fav: false,
                ),
                ChildOfCategoryTile(
                  title: "AB-5",
                  fav: false,
                ),
              ],
            ),
            CategoryExpansionTile(
              title: "Hostels",
              color: Colors.teal[300],
              children: <Widget>[
                ChildOfCategoryTile(
                  title: "Block - 16",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "Block - 17",
                  fav: false,
                ),
              ],
            ),
            CategoryExpansionTile(
              title: "Restaurants",
              color: Colors.red[300],
              children: <Widget>[
                ChildOfCategoryTile(
                  title: "McDonalds",
                  fav: false,
                ),
                ChildOfCategoryTile(
                  title: "Egg Factory",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "Domnios",
                  fav: false,
                ),
                ChildOfCategoryTile(
                  title: "MFC",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "KFC",
                  fav: false,
                ),
              ],
            ),
            CategoryExpansionTile(
              title: "Nature",
              color: Colors.green[300],
              children: <Widget>[
                ChildOfCategoryTile(
                  title: "Manipal Lake",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "Arbi Falls",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "End Point",
                  fav: false,
                ),
              ],
            ),
            CategoryExpansionTile(
              title: "Beaches",
              color: Colors.blue[300],
              children: <Widget>[
                ChildOfCategoryTile(
                  title: "Kapu Beach",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "Hoode Beach",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "Malpe Beach",
                  fav: true,
                ),
                ChildOfCategoryTile(
                  title: "Mattu Beach",
                  fav: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
