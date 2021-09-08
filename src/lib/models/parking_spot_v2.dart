import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

// TODO: Think of how multiple images stored in backend
//         use List<String> for multiple images
class ParkingSpotV2 {
  String id;
  LatLng coords;
  String name;
  // final String description;
  String address;
  double price;
  dynamic height;
  List<String> imageUrls;
  double avgRating;
  int numRatings;
  bool bought;

// Default constructor used to create dummy favorites tab
  ParkingSpotV2(
      {this.id,
      this.coords,
      this.name,
      this.address,
      this.price,
      this.height,
      this.imageUrls,
      this.avgRating,
      this.numRatings,
      this.bought});

  // ParkingSpotV2.fromJson(Map<String, dynamic> jsonData)
  //     : id = jsonData['id'].toString(),
  //       coords = LatLng(jsonData['lat'], jsonData['lng']),
  //       name = jsonData['name'],
  //       address = jsonData['address'],
  //       price = double.parse(jsonData['price'].toString()),
  //       // imageUrls = jsonData['imageUrl'],
  //       // imageUrls = jsonData['imageUrl'] as List,
  //       imageUrls = [],
  //       avgRating = double.parse(jsonData["avgRating"].toString()),
  //       numRatings = jsonData["numRatings"],
  //       bought = jsonData["bought"],
  //       height = double.parse(jsonData["height"].toString()) > 0
  //           ? double.parse(jsonData["height"].toString())
  //           : "No limit";

  // TODO: MY NEW JSON CONSTRUCTOR TO TEST
  ParkingSpotV2.fromJson(Map<String, dynamic> jsonData) {
    this.id = jsonData['id'].toString();
    this.name = jsonData['name'];
    this.address = jsonData['address'];
    this.price = double.parse(jsonData['price'].toStringAsFixed(2));
    this.coords = LatLng(jsonData['lat'], jsonData['lng']);
    // TODO: loop over all strings of "jsonData['imageUrl']" (DB WILL HAVE LIST OF STRING(S))
    this.imageUrls = [];
    this.imageUrls.add(jsonData['imageUrl']);

    this.avgRating = double.parse(jsonData["avgRating"].toString());
    this.numRatings = jsonData["numRatings"];
    this.bought = jsonData["bought"];
    this.height = double.parse(jsonData["height"].toString()) > 0
        ? double.parse(jsonData["height"].toString())
        : "No limit";
  }
}

var spot1V2 = ParkingSpotV2(
  id: "1",
  coords: LatLng(32.8801, 117.234),
  name: "Pangea @ UCSD",
  address: "9500 Gilman Drive, La Jolla, CA",
  price: 7.0,
  height: 150,
  imageUrls: [
    "https://ucsdnews.ucsd.edu/news_uploads/1280x800_210310-Rainbow7DSC_8071-UCSanDiego-ErikJepsen-1.jpg",
    "https://www.safdierabines.com/wp-content/uploads/2019/05/1606_N234_webview.jpg",
  ],
  avgRating: 4.1,
  numRatings: 28,
  bought: true,
);

var spot2V2 = ParkingSpotV2(
  id: "1",
  coords: LatLng(32.8801, 117.234),
  name: "Hopkins @ UCSD",
  address: "9500 Gilman Drive, La Jolla, CA",
  price: 7.0,
  height: 150,
  imageUrls: [
    "https://www.safdierabines.com/wp-content/uploads/2019/05/1606_N234_webview.jpg",
    "https://ucsdnews.ucsd.edu/news_uploads/1280x800_210310-Rainbow7DSC_8071-UCSanDiego-ErikJepsen-1.jpg",
  ],
  avgRating: 4.1,
  numRatings: 28,
  bought: false,
);

// Dummy ParkingSpotV2 list using for testing
List<ParkingSpotV2> spotsV2 = [spot2V2, spot1V2, spot1V2, spot2V2];
