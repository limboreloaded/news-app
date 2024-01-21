import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:bt_app/components/actions/action_content.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ActionCard extends ConsumerWidget {
  final String id;
  final String profileName;
  final String profileImage;
  final String createdAt;
  final String content;

  const ActionCard(
      {super.key,
      required this.id,
      required this.profileName,
      required this.profileImage,
      required this.createdAt,
      required this.content});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;

    return Card(
        margin: const EdgeInsets.only(top: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: InkWell(
            onTap: () => showFlexibleBottomSheet(
                  useRootNavigator: true,
                  anchors: [0, 0.5, 1],
                  context: context,
                  builder: (context, scrollController, bottomSheetOffset) =>
                      ActionContent(
                          scrollController: scrollController,
                          entityId: id,
                          content: content),
                ),
            child: Ink(
              width: width,
              height: 135,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 58, 55, 55),
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 12, left: 14, right: 14),
                child: Column(children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            CachedNetworkImageProvider(profileImage),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          SizedBox(
                              width: 150,
                              child: Text(
                                profileName,
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(fontFamily: 'Roboto'),
                              )),
                          const SizedBox(height: 4),
                          SizedBox(
                              width: 150,
                              child: Text(
                                '${timeago.format(DateTime.fromMillisecondsSinceEpoch(int.parse(DateTime.parse(createdAt).millisecondsSinceEpoch.toString())), locale: 'en_short')} ago',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.apply(fontFamily: 'Roboto'),
                              ))
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
            )));
  }
}
