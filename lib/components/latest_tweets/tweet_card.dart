import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class TweetCardNormal extends ConsumerWidget {
  final String id;
  final String author;
  final String urlIcon;
  final String content;
  final String createdAt;

  const TweetCardNormal(
      {super.key,
      required this.id,
      required this.author,
      required this.content,
      required this.createdAt,
      required this.urlIcon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          width: width,
          height: 135,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 55, 55),
              borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 14),
            child: Column(children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(urlIcon),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      SizedBox(
                        width: 150,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              author,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.apply(fontWeightDelta: 2),
                            )),
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          '${timeago.format(DateTime.fromMillisecondsSinceEpoch(int.parse(DateTime.parse(createdAt).millisecondsSinceEpoch.toString())), locale: 'en_short')} ago',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.apply(color: Colors.grey.shade400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  content,
                  maxLines: 2,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(fontFamily: 'Roboto'),
                ),
              )
            ]),
          ),
        ));
  }
}

class TweetCardShimmer extends StatelessWidget {
  const TweetCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
        baseColor: Colors.blueGrey,
        highlightColor: Colors.grey,
        child: Container(
          width: width,
          height: 135,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 58, 55, 55),
              borderRadius: BorderRadius.circular(16)),
          child: Container(
            padding:
                const EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 14),
          ),
        ));
  }
}
