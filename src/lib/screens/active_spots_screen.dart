import 'package:car_park_login/models/parking_spot.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

import '../widgets/active_spots_list.dart';
import '../widgets/active_spots_number_indicator.dart';

// TODO: Conditional-ize the image carousel (if no pictures)

class ActiveSpotsScreen extends StatefulWidget {
  ActiveSpotsScreen({Key key, this.userSpots}) : super(key: key);

  final List<ParkingSpot> userSpots;
  static const String id = '/activeSpots';

  @override
  _ActiveSpotsScreenState createState() => _ActiveSpotsScreenState();
}

class _ActiveSpotsScreenState extends State<ActiveSpotsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          ActiveSpotsNumberIndicator(
            numSpots: widget.userSpots.length,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: SizeConfig.screenHeight * 0.075,
              bottom: SizeConfig.screenHeight * 0.01,
            ),
          ),
          ActiveSpotsList(
            userSpots: widget.userSpots,
          ),
        ],
      ),
    );
  }
}
