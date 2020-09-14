import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final double latitude;
  final double longitude;

  FavouriteCard(
      {this.title, this.subtitle, this.image, this.latitude, this.longitude});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: this.image != null
                    ? AssetImage(this.image)
                    : null,
                foregroundColor: Colors.redAccent,
                child: (this.image != null)
                    ? null
                    : Icon(
                        Icons.favorite,
                      ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 5),
                        child: Text(
                          title,
                          style: GoogleFonts.ibmPlexSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "$latitude, $longitude",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      subtitle,
                      style: GoogleFonts.ibmPlexSans(
                          fontSize: 16, color: Colors.black54),
                    ),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
