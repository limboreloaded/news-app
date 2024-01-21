import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:shimmer/shimmer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:device_info_plus/device_info_plus.dart';

class RadarContent extends StatefulHookWidget {
  final String id;
  final String logo;
  final String title;
  final ScrollController scrollController;
  final double bottomSheetOffset;
  final dynamic content;

  const RadarContent({
    required this.id,
    required this.logo,
    required this.title,
    required this.content,
    required this.scrollController,
    required this.bottomSheetOffset,
    Key? key,
  }) : super(key: key);

  @override
  RadarContentState createState() => RadarContentState();
}

class RadarContentState extends State<RadarContent>
    with SingleTickerProviderStateMixin {
  late final ScrollController scrollController;
  late final double bottomSheetOffset;

  RadarContentState();

  bool scrolled = false;
  int currentPageIndex = 0;
  late PageController pageController =
      PageController(initialPage: currentPageIndex);
  bool isSpecialDevice = false;

  @override
  void initState() {
    checkDeviceType();

    scrollController = widget.scrollController;
    bottomSheetOffset = widget.bottomSheetOffset;

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

  void changePageIndex(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isExpanded = useState(false);
    final ValueNotifier<bool> loaded = useState(false);
    final ValueNotifier<int> currentPageIndex = useState(0);

    dynamic setExpandedState = useCallback((bool value) {
      isExpanded.value = value;
    }, []);

    dynamic changePageIndex = useCallback((int index) {
      currentPageIndex.value = index;
    }, []);

    useEffect(() {
      if (loaded.value == false) {
        Future.delayed(const Duration(seconds: 1), () => loaded.value = true);
      }
      return;
    }, [loaded.value]);

    return loaded.value
        ? RadarContentNormal(
            title: widget.title,
            content: widget.content,
            isSpecialDevice: isSpecialDevice,
            scrollController: scrollController,
            pageController: pageController,
            currentPageIndex: currentPageIndex.value,
            changePageIndex: changePageIndex,
            scrolled: scrolled,
            isExpanded: isExpanded.value,
            setExpandedState: setExpandedState)
        : const RadarContentShimmer();
  }
}

class RadarDisplay extends StatelessWidget {
  final dynamic content;

  const RadarDisplay({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.25,
        width: width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.grey),
        child: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                width: width,
                child: Text(
                  content,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.apply(fontFamily: 'Roboto'),
                ))));
  }
}

class RadarContentNormal extends ConsumerWidget {
  final String title;
  final ScrollController scrollController;
  final PageController pageController;
  final int currentPageIndex;
  final Function changePageIndex;
  final Function setExpandedState;
  final bool scrolled;
  final bool isExpanded;
  final bool isSpecialDevice;
  final dynamic content;

  const RadarContentNormal({
    super.key,
    required this.title,
    required this.scrollController,
    required this.pageController,
    required this.currentPageIndex,
    required this.changePageIndex,
    required this.scrolled,
    required this.isExpanded,
    required this.setExpandedState,
    required this.isSpecialDevice,
    required this.content,
  });

  List<Widget> generatePages() {
    List<Widget> widgetList = [];

    for (dynamic entry in content) {
      widgetList.add(Container(
        padding: const EdgeInsets.all(6),
        child: RadarDisplay(
          content: entry,
        ),
      ));
    }

    return widgetList;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return VisibilityDetector(
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.size.height > 500) {
            setExpandedState(true);
          } else if (visibilityInfo.visibleBounds !=
              const Rect.fromLTRB(0.0, 0.0, 0.0, 0.0)) {
            setExpandedState(false);
          }
        },
        key: const ValueKey('radar-expanded'),
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [];
            },
            body: Stack(children: [
              ListView(
                  padding: EdgeInsets.zero,
                  controller: scrollController,
                  children: [
                    Container(
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
                                  duration: const Duration(milliseconds: 300)),
                            ),
                            Positioned(
                              top: 75,
                              child: Text(
                                'Project Radar',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.apply(
                                        fontWeightDelta: 3,
                                        fontFamily: 'Roboto'),
                              ),
                            )
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 30),
                        height: height,
                        child: Column(children: [
                          const SizedBox(height: 50),
                          Container(
                            padding: const EdgeInsets.only(left: 24, right: 24),
                            width: width,
                            child: Text(
                              title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Container(
                              height: height * 0.33,
                              width: width,
                              padding: const EdgeInsets.all(20),
                              child: PageView(
                                controller: pageController,
                                onPageChanged: (index) =>
                                    changePageIndex(index),
                                children: generatePages(),
                              )),
                          AnimatedSmoothIndicator(
                            activeIndex: currentPageIndex,
                            count: content.length,
                            onDotClicked: (index) => changePageIndex(index),
                          )
                        ]))
                  ]),
              AnimatedCrossFade(
                firstChild: const Center(),
                secondChild: Container(
                    width: width,
                    height: !isSpecialDevice ? (height < 700 ? 60 : 75) : 100,
                    color: Colors.black,
                    child: Column(
                      children: [
                        SizedBox(
                            height: !isSpecialDevice
                                ? (height < 700 ? 30 : 43)
                                : 62),
                        Text(
                          'Title',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )),
                crossFadeState: scrolled
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
            ])));
  }
}

class RadarContentShimmer extends StatelessWidget {
  const RadarContentShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(children: [
      ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Container(
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
                        child: Container(
                          width: 120,
                          height: 5,
                          decoration: const BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                        )),
                    Positioned(
                        top: 75,
                        child: Shimmer.fromColors(
                            baseColor: Colors.blueGrey,
                            highlightColor: Colors.grey,
                            child: Text(
                              'Project Radar',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.apply(
                                      fontWeightDelta: 3, fontFamily: 'Roboto'),
                            )))
                  ],
                )),
            Container(
                padding: const EdgeInsets.only(top: 30),
                height: height,
                child: Column(children: [
                  const SizedBox(height: 50),
                  Shimmer.fromColors(
                      baseColor: Colors.blueGrey,
                      highlightColor: Colors.grey,
                      child: Container(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        width: width,
                        child: Text(
                          'Loading',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      )),
                  Container(
                      height: height * 0.33,
                      width: width,
                      padding: const EdgeInsets.all(20),
                      child: PageView(
                        children: const [
                          // Container(
                          //   padding: const EdgeInsets.all(6),
                          //   child: Shimmer.fromColors(
                          //       baseColor: Colors.blueGrey,
                          //       highlightColor: Colors.grey,
                          //       child: const RadarDisplay()),
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.all(6),
                          //   child: Shimmer.fromColors(
                          //       baseColor: Colors.blueGrey,
                          //       highlightColor: Colors.grey,
                          //       child: const RadarDisplay()),
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.all(6),
                          //   child: Shimmer.fromColors(
                          //       baseColor: Colors.blueGrey,
                          //       highlightColor: Colors.grey,
                          //       child: const RadarDisplay()),
                          // ),
                          // Container(
                          //   padding: const EdgeInsets.all(6),
                          //   child: Shimmer.fromColors(
                          //       baseColor: Colors.blueGrey,
                          //       highlightColor: Colors.grey,
                          //       child: const RadarDisplay()),
                          // ),
                        ],
                      )),
                ]))
          ]),
    ]);
  }
}
