import 'package:bt_app/controllers/action_item_controller.dart';
import 'package:bt_app/data/models.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ActionContent extends StatefulHookConsumerWidget {
  final ScrollController scrollController;
  final String entityId;
  final String content;

  const ActionContent(
      {super.key,
      required this.scrollController,
      required this.entityId,
      required this.content});

  @override
  ActionContentState createState() => ActionContentState();
}

class ActionContentState extends ConsumerState<ActionContent>
    with SingleTickerProviderStateMixin {
  ActionContentState();

  late final ScrollController scrollController;

  bool isSpecialDevice = false;
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
  Widget build(BuildContext context) {
    final itemController = ref.watch(actionItemFamily(widget.entityId));

    final ValueNotifier<bool> isExpanded = useState(false);

    dynamic setExpandedState = useCallback((bool value) {
      isExpanded.value = value;
    }, []);

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
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
            key: const ValueKey('article-content'),
            child: Stack(children: [
              ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  controller: scrollController,
                  children: [
                    SizedBox(
                        child: Container(
                            height: height * 0.2,
                            width: width,
                            color: Colors.black,
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
                                      crossFadeState: isExpanded.value
                                          ? CrossFadeState.showSecond
                                          : CrossFadeState.showFirst,
                                      duration:
                                          const Duration(milliseconds: 300)),
                                ),
                                itemController.when(
                                    data: (dynamic data) => const Image(
                                        height: 70,
                                        width: 200,
                                        image: AssetImage(
                                            "assets/pol/matic-logo.png")),
                                    loading: () =>
                                        const Center(child: Text("Loading...")),
                                    error: (_, __) => Center(
                                          child: Text(__.toString()),
                                        )),
                                Positioned(
                                    bottom: -15,
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
                                          'Actions'.toUpperCase(),
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
                            ))),
                    RepaintBoundary(
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, bottom: 24, top: 40),
                            child: Html(
                                data: widget.content,
                                onLinkTap: (url, attributes, element) async {
                                  //   if (url!.contains("https://btalk.link")) {
                                  //     final dynamic controller = ref.read(
                                  //         widget.entityType == "Dapp"
                                  //             ? dappProvider.notifier
                                  //             : (widget.entityType == "Chain"
                                  //                 ? chainsProvider.notifier
                                  //                 : nftsProvider.notifier));

                                  //     controller
                                  //         .fetchArticlesForEntity(
                                  //             widget.entityId.toString())
                                  //         .then((result) => showFlexibleBottomSheet(
                                  //               useRootNavigator: true,
                                  //               anchors: [0, 0.5, 1],
                                  //               context: context,
                                  //               builder:
                                  //                   (context, controller, offset) {
                                  //                 return ArticleContent(
                                  //                   scrollController:
                                  //                       scrollController,
                                  //                   entityId: widget.entityId,
                                  //                   entityType: widget.entityType,
                                  //                   content: widget.content,
                                  //                 );
                                  //               },
                                  //             ));
                                  //   } else {
                                  //     final Uri _url = Uri.parse(url);
                                  //     if (!await launchUrl(_url)) {
                                  //       print("Could not launch url");
                                  //     }
                                  //   }
                                  // },
                                }))),
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
                        itemController.when(
                            data: (ActionsModel data) => Text(data.author),
                            loading: () => const Text("Loading"),
                            error: (_, __) =>
                                Center(child: Text(__.toString())))
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
