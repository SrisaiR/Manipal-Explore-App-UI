import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  final Function(int) goToNewScreen;

  HomePage({this.goToNewScreen});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              "Welcome",
              style: GoogleFonts.ibmPlexSans(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "How would you like to explore Manipal?",
              style: GoogleFonts.ibmPlexSans(
                color: Colors.white70,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(
            height: 365,
            width: 300,
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
                    child: Text(
                      "Today's Featured",
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 22, color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 80),
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text("Kapu Beach", style: TextStyle(
                              color: Colors.white54,
                            ),),
                            leading: Icon(Icons.beach_access, color: Colors.white70,),
                          ),
                          ListTile(
                            title: Text("Chef Plated", style: TextStyle(
                              color: Colors.white54,
                            ),),
                            leading: Icon(Icons.restaurant, color: Colors.white70,),
                          ),
                          ListTile(
                            title: Text("Arbi Falls", style: TextStyle(
                              color: Colors.white54,
                            ),),
                            leading: Icon(Icons.nature, color: Colors.white70,),
                          ),
                          ListTile(
                            title: Text("Canara Mall", style: TextStyle(
                              color: Colors.white54,
                            ),),
                            leading: Icon(Icons.shopping_cart, color: Colors.white70,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 150),
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100].withOpacity(0.5),
            ),
            child: FlatButton(
              child: Text(
                "Show me the different Categories",
                style: GoogleFonts.ptSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  widget.goToNewScreen(2);
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 150),
            width: 250,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue[100].withOpacity(0.5),
            ),
            child: FlatButton(
              child: Text(
                "I would like to search the map",
                style: GoogleFonts.ptSans(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                setState(() {
                  widget.goToNewScreen(1);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
