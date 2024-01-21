import 'package:bt_app/components/latest_news/news_card.dart';
import 'package:bt_app/components/shared/currency_slider/currency_slider.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';
import 'package:bt_app/controllers/news_controller.dart';
import 'package:bt_app/controllers/various_controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsPage extends HookConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final latestNewsController = ref.watch(newsProvider);
    final filter = ref.watch(filterProvider);

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                CurrencySlider(onTap: (String tag) {
                  Vibrate.feedback(FeedbackType.heavy);
                  ref
                      .read(filterProvider.notifier)
                      .setFilter(filter.toString() == tag ? '' : tag);
                }),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Latest',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium
                                          ?.apply(fontWeightDelta: 2),
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                      size: 50,
                                      weight: 30,
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text('Tap any coin above to filter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)
                                  ],
                                ),
                              ],
                            )),
                      ],
                    )),
                Expanded(
                    child: latestNewsController.when(
                        data: (data) => Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => NewsCardNormal(
                                id: data[index].id.toString(),
                                image: data[index].urlImage,
                                content: data[index].title,
                                timestamp:
                                    DateTime.parse(data[index].publishedAt)
                                        .millisecondsSinceEpoch,
                              ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 20),
                              itemCount: data.length,
                            )),
                        error: (_, __) => Center(child: Text(__.toString())),
                        loading: () => Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            child: ShimmerList(
                                width: width,
                                height: 70,
                                borderRadius: BorderRadius.circular(16),
                                axis: Axis.vertical,
                                spacing: 20))))
              ],
            )));
  }
}
