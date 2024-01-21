import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:bt_app/components/latest_news/news_detail.dart';
import 'package:bt_app/controllers/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsCardModel {
  String image;
  String content;
  int timestamp;

  NewsCardModel(
      {required this.image, required this.content, required this.timestamp});
}

class NewsCardNormal extends ConsumerWidget {
  final String id;
  final String image;
  final String content;
  final int timestamp;

  const NewsCardNormal(
      {super.key,
      required this.id,
      required this.image,
      required this.content,
      required this.timestamp});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
        child: InkWell(
            onTap: () async {
              ref.read(newsProvider.notifier).viewNewsArticle(id);
              showFlexibleBottomSheet(
                  isModal: false,
                  minHeight: 0.8,
                  initHeight: 0.8,
                  maxHeight: 1,
                  anchors: [0, 0.8, 1],
                  useRootNavigator: true,
                  context: context,
                  builder: (context, scrollController, bottomSheetOffset) {
                    return NewsDetail(
                        id: id, scrollController: scrollController);
                  });
            },
            borderRadius: BorderRadius.circular(16),
            child: Ink(
              width: width,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 58, 55, 55),
                  borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: height,
                      width: width * 0.195,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16)),
                        child: Image(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(image)),
                      )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      content,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.apply(fontWeightDelta: 1),
                    ),
                  )),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 14, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.link_outlined, size: 22),
                        Text(
                          '${timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp), locale: 'en_short')} ago',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.apply(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}

class NewsCardShimmer extends StatelessWidget {
  const NewsCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: Colors.blueGrey,
      highlightColor: Colors.grey,
      child: Container(
        width: width,
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 58, 55, 55),
            borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
