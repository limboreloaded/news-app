import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bt_app/components/latest_projects/radar_content.dart';

class RadarCardNormal extends StatelessWidget {
  final String id;
  final String logo;
  final String title;
  final dynamic content;

  const RadarCardNormal({
    super.key,
    required this.id,
    required this.title,
    required this.logo,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            onTap: () => {
                  showFlexibleBottomSheet(
                      context: context,
                      builder: (context, controller, offset) {
                        return RadarContent(
                          id: id,
                          logo: logo,
                          content: content,
                          title: title,
                          scrollController: controller,
                          bottomSheetOffset: offset,
                        );
                      },
                      useRootNavigator: true,
                      anchors: [0, 0.5, 1])
                },
            borderRadius: BorderRadius.circular(16),
            child: Ink(
                width: 190,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(logo)),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ))));
  }
}

class RadarCardShimmer extends StatelessWidget {
  const RadarCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.grey,
        child: Container(
            width: 190,
            decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/pol/matic-logo.png")),
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple)));
  }
}
