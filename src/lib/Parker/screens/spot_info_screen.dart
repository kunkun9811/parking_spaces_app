import 'package:car_park_login/models/parking_spot_v2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../../models/parking_spot_v2.dart';
import '../../providers/providers.dart';

import '../widgets/spot_amenity_label.dart';
import '../widgets/spot_carousel.dart';
import '../widgets/spot_info_box.dart';
import '../widgets/spot_owner_box.dart';
import '../widgets/spot_buy_button.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

class SpotInfoScreen extends StatefulWidget {
  static const String id = '/spot_info';
  // final ParkingSpot spot;
  final ParkingSpotV2 spot;

  SpotInfoScreen({
    @required this.spot,
  });

  @override
  _SpotInfoScreenState createState() => _SpotInfoScreenState();
}

class _SpotInfoScreenState extends State<SpotInfoScreen> {
  final List<Image> spotImages = [
    Image.asset('assets/images/spot1.jpg'),
    Image.asset('assets/images/spot2.jpg'),
    Image.asset('assets/images/spot3.jpg'),
  ];

  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        extendBodyBehindAppBar: false,
        body: Consumer(
          builder: (context, watch, child) {
            final spot = watch(httpSpotFromIdProvider(widget.spot.id));
            return spot.when(
              data: (spot) => Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            SpotCarousel(
                              // TODO: Implement List<String> for spot images
                              images: [spot.imageUrl, spot.imageUrl],
                              // height: SizeConfig.screenHeight * 0.4,
                              height: 40.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    // vertical: 12,
                                    vertical: 1.5.h,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.chevron_left,
                                      // size: 60,
                                      size: 43.sp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SpotInfoBox(
                              spot: spot,
                            ),
                            // TODO: make a mapping for this, ParkingSpot will need list of strings for amenities
                            SpotAmenityLabel(
                              name: "Lights",
                              backgroundColor: Colors.white,
                              fontColor: Theme.of(context).primaryColor,
                            ),
                            Container(
                              // height: SizeConfig.screenHeight * 0.6,
                              // width: SizeConfig.screenWidth * 0.7,
                              height: 60.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                // borderRadius: BorderRadius.circular(10),
                                borderRadius: BorderRadius.circular(10.sp),
                                color: Colors.white,
                              ),
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(22, 88),
                                  zoom: 15,
                                ),
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                              ),
                            ),
                            // TODO: Each parking spot shall have owner property?
                            SpotOwnerBox(
                              // height: SizeConfig.screenHeight,
                              // width: SizeConfig.screenWidth,
                              owner: "Thomas",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (!spot.bought)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SpotBuyButton(
                        // height: SizeConfig.screenHeight * 0.065,
                        // width: SizeConfig.screenWidth * 0.8,
                        height: 6.5.h,
                        width: 80.w,
                        buttonColor: Theme.of(context).primaryColor,
                        cost: widget.spot.price,
                      ),
                    ),
                ],
              ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (err, stack) => Text("Something went wrong :/"),
            );
          },
        ),
      ),
    );
  }
}
