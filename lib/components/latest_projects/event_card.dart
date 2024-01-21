import 'package:bt_app/controllers/event_item_controller.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bt_app/components/latest_projects/event_content.dart';

class EventCard extends ConsumerWidget {
  final String id;
  final String cardImg;
  final String content;
  final String title;

  const EventCard(
      {super.key,
      required this.id,
      required this.content,
      required this.cardImg,
      required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              showFlexibleBottomSheet(
                minHeight: 0,
                initHeight: 0.5,
                maxHeight: 1,
                context: context,
                builder: (context, controller, offset) {
                  return EventContent(
                    id: id,
                    content: content,
                    title: title,
                    logo: cardImg,
                    scrollController: controller,
                  );
                },
                useRootNavigator: true,
                anchors: [0, 0.5, 1],
              );
            },
            child: Stack(children: [
              Ink(
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: cardImg != ''
                          ? CachedNetworkImageProvider(cardImg)
                          : Image.asset("assets/bt_logo.png").image),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
                child: Column(children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    height: 25,
                    width: 130,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 58, 55, 55),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Saturday, 30 May',
                      style: Theme.of(context).textTheme.bodySmall,
                    )),
                  )
                ]),
              ),
            ])));
  }
}
