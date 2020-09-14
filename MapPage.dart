import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_map_place/search_map_place.dart';
import 'CustomMarker.dart';
import 'package:google_fonts/google_fonts.dart';

const GOOGLE_API_KEY = "AIzaSyDEDy6ckwmPWJ6hG9pocwjWWRtrKSraGGA";

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  // TODO: Change the picture when button is pressed.
  // TODO: Currently you have to exit and press marker again to view next pic.

  // Google Map Controller
  GoogleMapController googleMapController;

  // Initial Manipal Camera View / Manipal const positions
  LatLng manipalCampusPos = LatLng(13.3525, 74.7928);
  LatLng manipalPos = LatLng(13.3490, 74.7856);

  // User Current Location
  LatLng curLocation;

  void getCurLocation() async {
    Position position = await GeolocatorPlatform.instance.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      this.curLocation = LatLng(position.latitude, position.longitude);
    });
    print("${this.curLocation.latitude}, ${this.curLocation.longitude}");
  }

  // Setting different Map Themes
  Future<String> getJsonFile(String filepath) async {
    return await rootBundle.loadString(filepath);
  }

  void setMapStyle(String mapStyle) {
    this.googleMapController.setMapStyle(mapStyle);
  }

  void changeMapStyle() {
    try {
      getJsonFile(this.mapThemes[this.mapThemeIndex]).then(this.setMapStyle);
    } catch (e) {}
  }

  // Collection of different themes
  List<String> mapThemes = [
    "assets/light_map.json",
    "assets/dark_map.json",
    "assets/retro_map.json",
    "assets/aubergine_map.json",
  ];

  // TODO: To change the theme, change index here, leave and come back to the tab.
  int mapThemeIndex = 1;

  // Set of Markers
  Set<Marker> _markers = Set<Marker>();

  List<CustomMarker> beachMarkers;
  List<CustomMarker> natureMarkers;
  List<CustomMarker> restaurantMarkers;
  List<CustomMarker> hostelMarkers;
  List<CustomMarker> campusMarkers;

  // To Open settings panel
  // TODO: Unable to setState on GoogleMaps, figure it out later.
  bool showSettings = false;

  // To show PolyLines
  // TODO: To Change this, change here, and come back to the page.
  bool showPolyLines = true;

  // Show Categories Separately
  // TODO: To change these, change here, and come back to see changes.
  bool beachVisible = true;
  bool natureVisible = true;
  bool restaurantVisible = true;
  bool hostelVisible = true;
  bool campusVisible = true;

  // List of polyLines
  List<Polyline> _polyLines = [];

  // Get PolyLines
  Polyline getPolyline(CustomMarker marker, Color color) {
    return Polyline(
      polylineId: PolylineId(marker.title),
      visible: true,
      color: color,
      endCap: Cap.roundCap,
      width: 2,
      points: [LatLng(marker.latitude, marker.longitude), manipalPos],
    );
  }

  @override
  void initState() {
    super.initState();

    // Set of Campus Point Markers
    campusMarkers = [
      CustomMarker(
          context: context,
          latitude: 13.3473,
          longitude: 74.7933,
          color: 30,
          title: "Student Plaza",
          subtitle: "Where students live",
          images: [
            "assets/images/Student_Plaza.JPG",
            "assets/images/StudentPlaza2.jpeg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.352419,
          longitude: 74.793457,
          color: 30,
          title: "AB-2",
          subtitle: "MSAP Classes",
          images: [
            "assets/images/AB-2.jpeg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.3536,
          longitude: 74.7939,
          color: 30,
          title: "AB-5",
          subtitle: "Where our exams take place",
          images: [
            "assets/images/AB-5.jpg",
          ]),
    ];

    // Set of Hostel Markers
    hostelMarkers = [
      CustomMarker(
        context: context,
        latitude: 13.3462,
        longitude: 74.7966,
        color: 290,
        title: "Block 16",
        subtitle: "Asia's Largest Hostel",
        images: [],
      ),
      CustomMarker(
          context: context,
          latitude: 13.3449,
          longitude: 74.7968,
          color: 290,
          title: "Block 17",
          subtitle: "The view from the hostel",
          images: [
            "assets/images/hostel_block_17_view.jpeg",
            "assets/images/block17_view_2.jpeg",
            "assets/images/block_17_view_3.jpeg",
          ]),
    ];

    // Set of Restaurant Markers
    restaurantMarkers = [];

    // Set of Nature Markers
    natureMarkers = [
      CustomMarker(
          context: context,
          latitude: 13.3368643,
          longitude: 74.793502,
          color: 160,
          title: "Arbi Falls",
          subtitle: "An amazing relaxing spot",
          images: [
            "assets/images/Arbi_Falls.jpg",
            "assets/images/Near_Arbi_Falls.jpg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.3415,
          longitude: 74.7858,
          color: 160,
          title: "Manipal Lake",
          subtitle: "Pleasant walking around here",
          images: [
            "assets/images/Manipal_Lake.jpg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.3701,
          longitude: 74.7858,
          color: 160,
          title: "End Point",
          subtitle: "A 3km stretch to walk with nature",
          images: [
            "assets/images/End_Point.jpg",
          ]),
    ];

    // Set of Beach Markers
    beachMarkers = [
      CustomMarker(
          context: context,
          latitude: 13.4088,
          longitude: 74.6971,
          color: 200,
          title: "Hoode Beach",
          subtitle: "Feels like an island",
          images: [
            "assets/images/Hoode_Beach.jpg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.2233,
          longitude: 74.7374,
          color: 200,
          title: "Kapu Beach",
          subtitle: "A Flat Beach",
          images: [
            "assets/images/Kapu_Beach_1.jpg",
            "assets/images/Kapu_Beach_2.jpg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.3555,
          longitude: 74.7044,
          color: 200,
          title: "Malpe Beach",
          subtitle: "Won't find better sunsets",
          images: [
            "assets/images/Malpe_Beach_1.jpg",
            "assets/images/Malpe_Beach_2.jpg",
          ]),
      CustomMarker(
          context: context,
          latitude: 13.2735,
          longitude: 74.7250,
          color: 200,
          title: "Mattu Beach",
          subtitle: "Has the prettiest views",
          images: [
            "assets/images/Mattu_Beach_1.jpg",
            "assets/images/Mattu_Beach_2.jpg",
          ]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 16,
                    bottom: 4,
                  ),
                  child: SearchMapPlaceWidget(
                    apiKey: GOOGLE_API_KEY,
                    language: "en",
                    location: manipalCampusPos,
                    radius: 40000,
                    onSelected: (Place place) async {
                      final geolocation = await place.geolocation;
                      setState(() {
                        googleMapController.animateCamera(
                            CameraUpdate.newLatLng(geolocation.coordinates));
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black87,
                        width: 10,
                      ),
                    ),
                    height: 550,
                    child: GoogleMap(
                      myLocationEnabled: true,
                      mapToolbarEnabled: true,
                      markers: _markers,
                      polylines: Set<Polyline>.from(_polyLines),
                      onMapCreated: (GoogleMapController controller) {
                        this.googleMapController = controller;
                        this.changeMapStyle();
                        setState(() {
                          this.getCurLocation();

                          // Markers

                          // Beach Markers
                          if (this.beachVisible) {
                            beachMarkers.forEach((CustomMarker marker) {
                              _markers.add(marker.getMarker());
                            });
                          }

                          // Nature Markers
                          if (this.natureVisible) {
                            natureMarkers.forEach((CustomMarker marker) {
                              _markers.add(marker.getMarker());
                            });
                          }

                          // Hostel Markers
                          if (this.hostelVisible) {
                            hostelMarkers.forEach((CustomMarker marker) {
                              _markers.add(marker.getMarker());
                            });
                          }

                          // Campus Markers
                          if (this.campusVisible) {
                            campusMarkers.forEach((CustomMarker marker) {
                              _markers.add(marker.getMarker());
                            });
                          }

                          // PolyLines

                          // Beach PolyLines
                          if (this.showPolyLines && this.beachVisible) {
                            beachMarkers.forEach((CustomMarker marker) {
                              _polyLines
                                  .add(getPolyline(marker, Colors.blue[300]));
                            });
                          }

                          // Nature PolyLines
                          if (this.showPolyLines && this.natureVisible) {
                            natureMarkers.forEach((CustomMarker marker) {
                              _polyLines
                                  .add(getPolyline(marker, Colors.green[300]));
                            });
                          }

                          // Hostel PolyLines
                          if (this.showPolyLines && this.hostelVisible) {
                            hostelMarkers.forEach((CustomMarker marker) {
                              _polyLines
                                  .add(getPolyline(marker, Colors.purple[300]));
                            });
                          }

                          // Campus PolyLines
                          if (this.showPolyLines && this.campusVisible) {
                            campusMarkers.forEach((CustomMarker marker) {
                              _polyLines
                                  .add(getPolyline(marker, Colors.orange[300]));
                            });
                          }
                        });
                      },
                      initialCameraPosition: CameraPosition(
                        target: manipalCampusPos,
                        zoom: 14.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 175,
          right: 25,
          child: Center(
            child: Card(
              child: Container(
                width: 40,
                height: 40,
                color: Colors.white,
                child: IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.blueGrey,
                    size: 25,
                  ),
                  onPressed: () {
                    setState(() {
                      this.showSettings = true;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
        this.showSettings
            ? Positioned(
                left: MediaQuery.of(context).size.width / 2,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple[100], Colors.deepPurple[400]],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.close,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              setState(() {
                                this.showSettings = false;
                              });
                            },
                          ),
                          Text(
                            "Settings Page",
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Lines to Markers",
                              style: GoogleFonts.kanit(fontSize: 16),
                            ),
                          ),
                          Spacer(),
                          Switch(
                            activeTrackColor: Colors.blueGrey,
                            activeColor: Colors.tealAccent,
                            onChanged: (bool b) {
                              setState(() {
                                this.showPolyLines = !this.showPolyLines;
                              });
                            },
                            value: this.showPolyLines,
                          )
                        ],
                      ),
                      Divider(),
                      ListTile(
                        title: Text(
                          "Campus Points",
                          style: GoogleFonts.kanit(fontSize: 16),
                        ),
                        trailing: this.campusVisible
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                        onTap: () {
                          setState(() {
                            this.campusVisible = !this.campusVisible;
                          });
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Hostel",
                          style: GoogleFonts.kanit(fontSize: 16),
                        ),
                        trailing: this.hostelVisible
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                        onTap: () {
                          setState(() {
                            this.hostelVisible = !this.hostelVisible;
                          });
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Nature",
                          style: GoogleFonts.kanit(fontSize: 16),
                        ),
                        trailing: this.natureVisible
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                        onTap: () {
                          setState(() {
                            this.natureVisible = !this.natureVisible;
                          });
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Beaches",
                          style: GoogleFonts.kanit(fontSize: 16),
                        ),
                        trailing: this.beachVisible
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                        onTap: () {
                          setState(() {
                            this.beachVisible = !this.beachVisible;
                          });
                        },
                      ),
                      Divider(),
                      Text(
                        "Map Themes",
                        style: GoogleFonts.kanit(
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Light Theme",
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Radio(
                                activeColor: Colors.white,
                                groupValue: this.mapThemeIndex,
                                value: 0,
                                onChanged: (int val) {
                                  setState(() {
                                    this.mapThemeIndex = val;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Dark",
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Radio(
                                activeColor: Colors.white,
                                groupValue: this.mapThemeIndex,
                                value: 1,
                                onChanged: (int val) {
                                  setState(() {
                                    this.mapThemeIndex = val;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Retro",
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Radio(
                                activeColor: Colors.white,
                                groupValue: this.mapThemeIndex,
                                value: 2,
                                onChanged: (int val) {
                                  setState(() {
                                    this.mapThemeIndex = val;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: Text(
                                "Aubergine",
                                style: GoogleFonts.kanit(
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Radio(
                                activeColor: Colors.white,
                                groupValue: this.mapThemeIndex,
                                value: 3,
                                onChanged: (int val) {
                                  setState(() {
                                    this.mapThemeIndex = val;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
