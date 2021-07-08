import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/spot_result.dart';
import '../widgets/draggable_indicator.dart';

// Demo Display on settings page of Slide-up Panel
class PanelWidget extends StatelessWidget {
  final ScrollController controller;

  PanelWidget({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return ListView(
    //   physics: BouncingScrollPhysics(),
    //   padding: EdgeInsets.only(top: 10),
    //   controller: controller,
    //   children: [
    //     SpotResult(
    //       name: "Pangea L1S5",
    //       address: "9500 Gilman Drive, La Jolla, CA 92093",
    //       price: 5,
    //       bought: false,
    //       height: 130,
    //       imageUrl:
    //           "https://extension.ucsd.edu/UCSDExtension/media/UCSDExtensionsMedia/about-extension/locations-maps-and-transportation/pangea2.jpg",
    //     ),
    //     SpotResult(
    //       name: "Pangea L1S6",
    //       address: "9500 Gilman Drive, La Jolla, CA 92093",
    //       price: 5,
    //       bought: false,
    //       height: 140,
    //       imageUrl:
    //           "https://extension.ucsd.edu/UCSDExtension/media/UCSDExtensionsMedia/about-extension/locations-maps-and-transportation/pangea2.jpg",
    //     ),
    //     SpotResult(
    //       name: "Hopkins L3S12",
    //       address: "Voigt Dr, La Jolla, CA 92093",
    //       price: 3,
    //       bought: false,
    //       height: 150,
    //       imageUrl:
    //           "https://watrydesign.com/uploads/sliders/projects/large/Watry-Design-UC-San-Diego-1024wx500h.jpg",
    //     ),
    //     SpotResult(
    //       name: "Hopkins L3S19",
    //       address: "Voigt Dr, La Jolla, CA 92093",
    //       price: 3,
    //       bought: false,
    //       height: 150,
    //       imageUrl:
    //           "https://watrydesign.com/uploads/sliders/projects/large/Watry-Design-UC-San-Diego-1024wx500h.jpg",
    //     ),
    //     SpotResult(
    //       name: "Osler L4S05",
    //       address: "9500 Gilman Dr, San Diego, CA 92161",
    //       price: 4,
    //       bought: false,
    //       height: 150,
    //       imageUrl:
    //           "https://www.watrydesign.com/uploads/sliders/projects/large/190826133a-1024wx500h.jpg",
    //     ),
    //   ],
    // );
  }
}
