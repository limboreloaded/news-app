import 'package:bt_app/components/shared/project_card.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';
import 'package:bt_app/controllers/dapp_controller.dart';
import 'package:bt_app/controllers/events_controller.dart';
import 'package:bt_app/controllers/radar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bt_app/components/latest_projects/event_card.dart';
import 'package:bt_app/components/latest_projects/radar_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectsPage extends StatefulHookConsumerWidget {
  const ProjectsPage({super.key});

  @override
  ProjectsPageState createState() => ProjectsPageState();
}

class ProjectsPageState extends ConsumerState<ProjectsPage>
    with SingleTickerProviderStateMixin {
  ProjectsPageState();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 50),
      children: [
        Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'New',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.apply(fontWeightDelta: 2),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.apply(color: CupertinoColors.activeBlue),
                            )),
                        SizedBox(width: width * 0.025)
                      ],
                    )
                  ],
                ),
                SizedBox(width: width, height: 150, child: const DappRow()),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Upcoming Events',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.apply(fontWeightDelta: 2),
                        )),
                  ],
                ),
                SizedBox(width: width, height: 140, child: const EventsRow()),
              ],
            ),
            const SizedBox(height: 50),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 10),
                        child: Text(
                          'Radar',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.apply(fontWeightDelta: 2),
                        )),
                  ],
                ),
                SizedBox(width: width, height: 170, child: const RadarsRow()),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ],
    ));
  }
}

class DappRow extends HookConsumerWidget {
  const DappRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dappController = ref.watch(dappProvider);
    final width = MediaQuery.of(context).size.width;

    return dappController.when(
        data: (data) => ListView.separated(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: ProjectCard(
                      id: data[index].id,
                      urlLogo: data[index].urlLogo,
                      large: true,
                      type: "Dapp",
                    ));
              }

              return ProjectCard(
                id: data[index].id,
                urlLogo: data[index].urlLogo,
                large: true,
                type: "Dapp",
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: data.length),
        error: (_, __) => Center(child: Text(__.toString())),
        loading: () => Padding(
            padding: const EdgeInsets.only(left: 18),
            child: ShimmerList(
                width: width,
                height: 125,
                borderRadius: BorderRadius.circular(20),
                axis: Axis.horizontal,
                spacing: 20)));
  }
}

class EventsRow extends HookConsumerWidget {
  const EventsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventController = ref.watch(eventsProvider);
    final width = MediaQuery.of(context).size.width;

    return eventController.when(
        data: (data) => ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: EventCard(
                          id: data[index].id,
                          content: data[index].content,
                          title: data[index].title,
                          cardImg: data[index].urlImage));
                }
                return EventCard(
                    id: data[index].id,
                    content: data[index].content,
                    title: data[index].title,
                    cardImg: data[index].urlImage);
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: data.length,
            ),
        error: (_, __) => Center(child: Text(__.toString())),
        loading: () => ShimmerList(
            width: width,
            height: 140,
            borderRadius: BorderRadius.circular(20),
            axis: Axis.horizontal,
            spacing: 20));
  }
}

class RadarsRow extends HookConsumerWidget {
  const RadarsRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final radarController = ref.watch(radarsProvider);
    final width = MediaQuery.of(context).size.width;

    return radarController.when(
        data: (data) => ListView.separated(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 18),
                      child: RadarCardNormal(
                        id: data[index].id,
                        content: data[index].content,
                        title: data[index].title,
                        logo: data[index].urlImage,
                      ));
                }
                return RadarCardNormal(
                  id: data[index].id,
                  content: data[index].content,
                  title: data[index].title,
                  logo: data[index].urlImage,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: data.length,
            ),
        error: (_, __) => Center(child: Text(__.toString())),
        loading: () => ShimmerList(
            height: 170,
            width: width,
            borderRadius: BorderRadius.circular(20),
            axis: Axis.horizontal,
            spacing: 20));
  }
}
