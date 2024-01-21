import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Axis axis;
  final double spacing;

  const ShimmerList(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.axis,
      required this.spacing});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: axis,
        shrinkWrap: true,
        itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.blueGrey,
            highlightColor: Colors.grey,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: const Color.fromARGB(255, 58, 55, 55)),
                height: height,
                width: width)),
        separatorBuilder: (context, index) {
          return axis == Axis.vertical
              ? SizedBox(height: spacing)
              : SizedBox(width: spacing);
        },
        itemCount: 10);
  }
}
