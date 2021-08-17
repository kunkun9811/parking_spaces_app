import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../theme.dart';

import '../../models/parking_spot_v2.dart';

import '../widgets/spotter_listing.dart';

class SpotListingsScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: customBlack,
          endDrawer: Drawer(
            child: Container(
              color: customBlack,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 3.5.h),
                    child: Text(
                      "Filters",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                    child: Text(
                      "Today's Spots",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5.w),
                    height: 5.4.h,
                    width: 5.4.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      border: Border.all(color: customCyan, width: 2.sp),
                    ),
                    child: IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState.openEndDrawer();
                      },
                      icon: Icon(Icons.sort_outlined),
                    ),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemBuilder: (context, index) {
                    return SpotterListing(
                      spot: spotsV2[index],
                    );
                  },
                  itemCount: spotsV2.length,
                ),
              ),
            ],
          )),
    );
  }
}