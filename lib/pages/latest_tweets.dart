import 'package:bt_app/components/latest_tweets/tweet_card.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';
import 'package:bt_app/controllers/tweets_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TweetsPage extends HookConsumerWidget {
  const TweetsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final latestTweetsController = ref.watch(tweetsProvider);

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: latestTweetsController.when(
                  data: (data) => ListView.separated(
                        padding: const EdgeInsets.only(
                            top: 50,
                            left: 20,
                            right: 20,
                            bottom: kFloatingActionButtonMargin + 100),
                        itemBuilder: (context, index) => TweetCardNormal(
                          id: data[index].id,
                          author: data[index].author,
                          urlIcon: data[index].urlIcon,
                          content: data[index].content,
                          createdAt: data[index].createdAt.toString(),
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 20),
                        itemCount: data.length,
                      ),
                  error: (_, __) => Center(child: Text(__.toString())),
                  loading: () => Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 24, right: 24),
                      child: ShimmerList(
                          width: width,
                          height: 135,
                          borderRadius: BorderRadius.circular(16),
                          axis: Axis.vertical,
                          spacing: 20))))
        ],
      ),
    ));
  }
}
