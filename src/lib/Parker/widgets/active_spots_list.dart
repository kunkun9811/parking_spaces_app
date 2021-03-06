import 'package:car_park_login/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import './spot_result.dart';
import '../../models/parking_spot.dart';
import '../widgets/active_spots_list_element.dart';

// Allows us to use percentage of device height/width
import 'package:sizer/sizer.dart';

// TODO: Correct the time formating
class ActiveSpotsList extends ConsumerWidget {
  final List<ParkingSpot> userSpots;

  ActiveSpotsList({
    @required this.userSpots,
  });

  // TODO: Should maybe change name of variables with this... (calculates current rent time)
  DateTime calcRentTime(DateTime start) {
    final diffHr = start.difference(DateTime.now()).inHours;
    final diffMin = start.difference(DateTime.now()).inMinutes;

    return new DateTime(start.year, start.month, start.day, diffHr, diffMin);
  }

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final activeSpots = watch(userActiveSpotsProvider);
    // TODO: Maybe expanded to resolve overflow if it persists...
    return Expanded(
      child: Container(
        // height: SizeConfig.screenHeight * 0.8,
        // height: 80.h,
        child: RefreshIndicator(
          onRefresh: () {
            return context.read(userActiveSpotsProvider.notifier).loadList();
          },
          child: ListView.builder(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            padding: EdgeInsets.all(0),
            itemBuilder: (buildContext, index) {
              final currTime = "5";
              // DateTime timeLeft = calcRentTime(spots[index].startTime);
              // final left = DateFormat.Hm().format(timeLeft);
              return SpotResult(
                spot: activeSpots[index],
              );
            },
            itemCount: activeSpots.length,
          ),
        ),
      ),
    );
  }
}
