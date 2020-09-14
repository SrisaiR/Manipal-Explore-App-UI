import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'FavouriteCard.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  // TODO: PLEASE FINISH FAVOURITES
  List<FavouriteCard> _favourites = [
    FavouriteCard(
      title: "Student Plaza",
      subtitle: "Where students meet",
      image: "assets/images/StudentPlaza2.jpeg",
      latitude: 13.3473,
      longitude: 74.7933,
    ),
    FavouriteCard(
      title: "Block 16",
      subtitle: "Asia's Largest Hostel",
      latitude: 13.3462,
      longitude: 74.7966,
    ),
    FavouriteCard(
      title: "Arbi Falls",
      subtitle: "An amazing relaxing spot",
      image: "assets/images/Arbi_Falls.jpg",
      latitude: 13.3368643,
      longitude: 74.793502,
    ),
    FavouriteCard(
      title: "Manipal Lake",
      subtitle: "Pleasant walking around here",
      image: "assets/images/Manipal_Lake.jpg",
      latitude: 13.3415,
      longitude: 74.7858,
    ),
    FavouriteCard(
      title: "Kapu Beach",
      subtitle: "A Flat Beach",
      image: "assets/images/Kapu_Beach_2.jpg",
      latitude: 13.2233,
      longitude: 74.7374,
    ),
    FavouriteCard(
      latitude: 13.3555,
      longitude: 74.7044,
      title: "Malpe Beach",
      subtitle: "Won't find better sunsets",
      image: "assets/images/Malpe_Beach_1.jpg",
    ),
    FavouriteCard(
      latitude: 13.4088,
      longitude: 74.6971,
      title: "Hoode Beach",
      subtitle: "Feels like an island",
      image: "assets/images/Hoode_Beach.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 650,
          width: 500,
          child: Column(
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
                  "Favourites",
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
                  "See your favourite places here!",
                  style: GoogleFonts.ibmPlexSans(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: _favourites.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _favourites[index];
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
