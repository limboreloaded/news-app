import 'package:bt_app/main.dart';
import 'package:flutter/material.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bt_app/components/home/home_activities.dart';
import 'package:bt_app/components/home/home_featured.dart';
import 'package:bt_app/components/home/home_navigation.dart';
import 'package:bt_app/components/home/user_info.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: CustomRefreshIndicator(
      builder: MaterialIndicatorDelegate(
        displacement: 120,
        builder: (context, controller) {
          return const Icon(
            Icons.ac_unit,
            color: Colors.blue,
            size: 30,
          );
        },
      ),
      onRefresh: () async {},
      child: CustomScrollView(
        controller: PageWrapper.of(context)?.bottomBarController,
        slivers: [
          SliverAppBar(
              collapsedHeight: 115,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
              flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                return const FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: EdgeInsets.only(
                        left: 20, top: 16, bottom: 16, right: 14),
                    title: UserInfo());
              }),
              floating: false,
              snap: false,
              pinned: false),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const HomeNavigation(),
                const HomeFeatured(),
                const HomeActivitiesShimmer(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
