import 'package:bt_app/controllers/various_controllers.dart';
import 'package:bt_app/data/models.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:bt_app/components/latest_projects/event_content.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bt_app/components/shared/project_card.dart';
import 'package:bt_app/controllers/event_item_controller.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';

class ProjectModel {
  final String icon;
  final DateTime? date;
  final bool isEvent;

  ProjectModel({
    required this.icon,
    this.date,
    this.isEvent = false,
  });
}

Map typesToString = {
  "_\$_ChainsModel": "Chain",
  "_\$_DappsModel": "Dapp",
  "_\$_NftsModel": "Nft",
  "_\$_EventsModel": "Event"
};

class HomeFeatured extends HookConsumerWidget {
  const HomeFeatured({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeProjectsController = ref.watch(homeProjectsProvider);

    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(top: 30, left: 12),
      width: width,
      child: Column(children: [
        SizedBox(
            width: width,
            child: Text(
              'Projects & Events',
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.apply(fontWeightDelta: 2),
            )),
        const SizedBox(height: 10),
        SizedBox(
            width: width,
            height: 150,
            child: homeProjectsController.when(
                data: (data) => ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => FeaturedCard(
                        title: data[index] is! EventsModel
                            ? data[index].name
                            : data[index].title,
                        content: data[index] is! EventsModel
                            ? data[index].name
                            : data[index].title,
                        icon: data[index] is! EventsModel
                            ? data[index].urlLogo
                            : data[index].urlImage,
                        id: data[index].id,
                        type: data[index].runtimeType,
                        date: (data[index] is EventsModel
                            ? DateTime.parse(data[index].scheduledFor)
                            : null),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 20),
                      itemCount: data.length,
                    ),
                error: (_, __) => Center(
                      child: Text(__.toString()),
                    ),
                loading: () => ShimmerList(
                    width: 140,
                    height: 140,
                    borderRadius: BorderRadius.circular(16),
                    axis: Axis.horizontal,
                    spacing: 20)))
      ]),
    );
  }
}

class FeaturedCard extends StatelessWidget {
  final String icon;
  final DateTime? date;
  final String? id;
  final String title;
  final String content;
  final Type type;

  const FeaturedCard({
    super.key,
    required this.icon,
    this.date,
    this.id,
    required this.title,
    required this.content,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return FeaturedCardNormal(
        date: date,
        icon: icon,
        title: title,
        id: id,
        type: type,
        content: content);
  }
}

class FeaturedCardNormal extends HookConsumerWidget {
  final String icon;
  final DateTime? date;
  final String? id;
  final String title;
  final Type type;
  final String content;

  const FeaturedCardNormal({
    super.key,
    required this.icon,
    this.date,
    this.id,
    required this.title,
    required this.type,
    required this.content,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<bool> isEvent = useState(date != null ? true : false);

    if (isEvent.value) {
      final eventItemController = ref.watch(eventsItemFamily(id.toString()));

      return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => showFlexibleBottomSheet(
              context: context,
              builder: (context, controller, offset) {
                return EventContent(
                  id: id!,
                  content: content,
                  logo: icon,
                  title: title,
                  scrollController: controller,
                );
              },
              useRootNavigator: true,
              anchors: [0, 0.5, 1]),
          child: Ink(
            height: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: icon != ''
                      ? CachedNetworkImageProvider(icon)
                      : Image.asset("assets/bt_logo.png").image),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 119, 105, 105),
            ),
            child: Stack(children: [
              Column(children: [
                const SizedBox(
                  height: 115,
                ),
                Center(
                    child: Container(
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
                ))
              ]),
            ]),
          ));
    } else {
      return ProjectCard(
          id: id.toString(),
          urlLogo: icon,
          large: false,
          type: typesToString[type.toString()]);
    }
  }
}
