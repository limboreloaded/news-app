// ignore_for_file: use_build_context_synchronously

import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:bt_app/components/shared/article_content.dart';
import 'package:bt_app/data/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:device_info_plus/device_info_plus.dart';

class EventContent extends StatefulHookWidget {
  final ScrollController scrollController;
  final String id;
  final String content;
  final String title;
  final String logo;

  const EventContent({
    super.key,
    required this.scrollController,
    required this.id,
    required this.content,
    required this.logo,
    required this.title,
  });

  @override
  EventContentState createState() => EventContentState();
}

class EventContentState extends State<EventContent>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  bool isSpecialDevice = false;

  EventContentState();

  bool scrolled = false;

  @override
  void initState() {
    checkDeviceType();

    scrollController = widget.scrollController;

    scrollController.addListener(() {
      if (scrollController.position.pixels >= 60) {
        setState(() {
          scrolled = true;
        });
      } else if (scrolled == true) {
        setState(() {
          scrolled = false;
        });
      }
    });

    super.initState();
  }

  void checkDeviceType() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;

    if (deviceInfo.data["name"] == "iPhone 14 Pro") {
      setState(() {
        isSpecialDevice = true;
      });
    } else {
      setState(() {
        isSpecialDevice = false;
      });
    }
  }

  @override
  void didUpdateWidget(EventContent oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExpanded = useState(false);
    final ValueNotifier<bool> loaded = useState(false);

    dynamic setExpandedState = useCallback((bool value) {
      isExpanded.value = value;
    }, []);

    useEffect(() {
      if (loaded.value == false) {
        Future.delayed(const Duration(seconds: 1), () => loaded.value = true);
      }
      return;
    }, [loaded.value]);

    return EventContentNormal(
        id: widget.id,
        content: widget.content,
        title: widget.title,
        logo: widget.logo,
        isSpecialDevice: isSpecialDevice,
        scrollController: scrollController,
        loaded: loaded.value,
        scrolled: scrolled,
        isExpanded: isExpanded.value,
        setExpandedState: setExpandedState,
        mounted: mounted,
        fetchedNews: const []);
  }
}

class EventContentNormal extends ConsumerWidget {
  final ScrollController scrollController;
  final bool scrolled;
  final String content;
  final String id;
  final bool loaded;
  final bool isSpecialDevice;
  final bool isExpanded;
  final Function setExpandedState;
  final bool mounted;
  final String title;
  final String logo;
  final List<NewsModel> fetchedNews;

  const EventContentNormal(
      {super.key,
      required this.scrollController,
      required this.scrolled,
      required this.logo,
      required this.loaded,
      required this.isExpanded,
      required this.setExpandedState,
      required this.mounted,
      required this.content,
      required this.id,
      required this.fetchedNews,
      required this.title,
      required this.isSpecialDevice});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [];
            },
            body: VisibilityDetector(
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.size.height > 500) {
                    setExpandedState(true);
                  } else if (visibilityInfo.visibleBounds !=
                      const Rect.fromLTRB(0.0, 0.0, 0.0, 0.0)) {
                    setExpandedState(false);
                  }
                },
                key: const ValueKey('event-expanded'),
                child: Stack(children: [
                  ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      controller: scrollController,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(16),
                            height: height * 0.2,
                            width: width,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  top: 10,
                                  child: AnimatedCrossFade(
                                      firstChild: Container(
                                        width: 120,
                                        height: 5,
                                        decoration: const BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                      ),
                                      secondChild: const Center(),
                                      crossFadeState: isExpanded
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 300)),
                                ),
                                Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                        onPressed: () async {
                                          GoRouter.of(context).pop();
                                          showFlexibleBottomSheet(
                                            useRootNavigator: true,
                                            anchors: [0, 0.5, 1],
                                            context: context,
                                            builder:
                                                (context, controller, offset) {
                                              return ArticleContent(
                                                content: content,
                                                entityId: id,
                                                entityType: "Dapp",
                                                scrollController: controller,
                                              );
                                            },
                                          );
                                        },
                                        icon: AnimatedCrossFade(
                                            firstChild: const Icon(
                                              Icons.info,
                                              color: Colors.white,
                                            ),
                                            secondChild: const Center(),
                                            crossFadeState: isExpanded
                                                ? CrossFadeState.showSecond
                                                : CrossFadeState.showFirst,
                                            duration: const Duration(
                                                milliseconds: 300)))),
                                Image(
                                    height: 70,
                                    width: 200,
                                    image: logo != ''
                                        ? CachedNetworkImageProvider(logo)
                                        : Image.asset("assets/bt_logo.png")
                                            .image),
                                Positioned(
                                    bottom: -30,
                                    child: Container(
                                      width: 240,
                                      height: 35,
                                      decoration: const BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 232, 221, 221),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      child: Center(
                                        child: Text(
                                          'Saturday, 30 May'.toUpperCase(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.apply(
                                                color: Colors.black,
                                                fontWeightDelta: 2,
                                              ),
                                        ),
                                      ),
                                    ))
                              ],
                            )),
                        Padding(
                            padding: const EdgeInsets.all(24),
                            child: Container(
                                padding: const EdgeInsets.only(top: 30),
                                height: height,
                                child: Column(children: [
                                  SizedBox(
                                    width: width,
                                    child: Text(
                                      title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.apply(
                                              fontWeightDelta: 3,
                                              fontFamily: 'Roboto'),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                      width: width,
                                      child: Text(
                                        content,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.apply(fontFamily: 'Roboto'),
                                      )),
                                ])))
                      ]),
                  AnimatedCrossFade(
                    firstChild: const Center(),
                    secondChild: Container(
                        width: width,
                        height:
                            !isSpecialDevice ? (height < 700 ? 60 : 75) : 100,
                        color: Colors.black,
                        child: Column(
                          children: [
                            SizedBox(
                                height: !isSpecialDevice
                                    ? (height < 700 ? 30 : 43)
                                    : 62),
                            Text(
                              title,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        )),
                    crossFadeState: scrolled
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 200),
                  ),
                ]))));
  }
}

class EventContentShimmer extends StatelessWidget {
  const EventContentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
        child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
          Container(
              height: height * 0.2,
              width: width,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 10,
                      child: Container(
                        width: 120,
                        height: 5,
                        decoration: const BoxDecoration(
                            color: Colors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                      )),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: const Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          if (kDebugMode) {
                            print('HELLO');
                          }
                        },
                      )),
                  Shimmer.fromColors(
                      baseColor: Colors.blueGrey,
                      highlightColor: Colors.grey,
                      child: const CircleAvatar(radius: 32)),
                  Positioned(
                      bottom: -30,
                      child: Shimmer.fromColors(
                          baseColor: Colors.blueGrey,
                          highlightColor: Colors.grey,
                          child: Container(
                            width: 240,
                            height: 35,
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 232, 221, 221),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Center(
                              child: Text(
                                'Decentralized Exchanges',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.apply(color: Colors.black),
                              ),
                            ),
                          )))
                ],
              )),
          Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                  padding: const EdgeInsets.only(top: 30),
                  height: height,
                  child: Column(children: [
                    Shimmer.fromColors(
                        baseColor: Colors.blueGrey,
                        highlightColor: Colors.grey,
                        child: SizedBox(
                          width: width,
                          child: Text(
                            'Loading',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.apply(
                                    fontWeightDelta: 3, fontFamily: 'Roboto'),
                          ),
                        )),
                    const SizedBox(height: 20),
                    Shimmer.fromColors(
                        baseColor: Colors.blueGrey,
                        highlightColor: Colors.grey,
                        child: SizedBox(
                            width: width,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(fontFamily: 'Roboto'),
                            ))),
                    const SizedBox(height: 20),
                    Shimmer.fromColors(
                        baseColor: Colors.blueGrey,
                        highlightColor: Colors.grey,
                        child: SizedBox(
                            width: width,
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(fontFamily: 'Roboto'),
                            ))),
                    const SizedBox(height: 30),
                    Shimmer.fromColors(
                        baseColor: Colors.blueGrey,
                        highlightColor: Colors.grey,
                        child: SizedBox(
                          width: width,
                          child: Text(
                            'Loading',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.apply(
                                    fontWeightDelta: 3, fontFamily: 'Roboto'),
                          ),
                        )),
                    const SizedBox(height: 20),
                  ])))
        ]));
  }
}
