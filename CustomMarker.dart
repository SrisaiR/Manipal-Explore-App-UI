import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMarker {
  BuildContext context;
  double latitude;
  double longitude;
  double color;
  String title;
  String subtitle;
  List<String> images;

  int _curIndex = 0;

  LatLng manipalCampusPos = LatLng(13.3525, 74.7928);

  CustomMarker({
    this.context,
    this.latitude,
    this.longitude,
    this.color,
    this.title,
    this.subtitle,
    this.images,
  });

  showDialogBox() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 300,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.title,
                      style: GoogleFonts.ibmPlexSans(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          this.subtitle,
                          style: GoogleFonts.ibmPlexSans(
                            color: Colors.black54,
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Disatnce from MIT building: ${distanceBetween(this.latitude, this.longitude, manipalCampusPos.latitude, manipalCampusPos.longitude).floor()} m"),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                    Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            splashColor: Colors.black54,
                            icon: Icon(Icons.arrow_back_ios),
                            onPressed: () {
                              if (this._curIndex != 0) {
                                this._curIndex -= 1;
                              } else {
                                this._curIndex = images.length - 1 == -1
                                    ? 0
                                    : images.length - 1;
                              }
                            },
                          ),
                          images.length == 0
                              ? Center(
                                  child: Text(
                                    "No Pictures Available",
                                    style: GoogleFonts.ibmPlexSans(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                )
                              : Container(
                                  height: 200,
                                  width: 200,
                                  child: Image.asset(
                                    images[_curIndex],
                                    fit: BoxFit.cover,
                                  )),
                          Spacer(),
                          IconButton(
                            splashColor: Colors.black54,
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () {
                              if (this._curIndex < images.length - 1) {
                                this._curIndex += 1;
                              } else {
                                this._curIndex = 0;
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(""),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Marker getMarker() {
    return Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(this.color),
      onTap: () {
        this.showDialogBox();
      },
      position: LatLng(this.latitude, this.longitude),
      markerId: MarkerId(this.title),
    );
  }
}
