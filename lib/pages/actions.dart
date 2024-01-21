import 'package:bt_app/controllers/actions_controller.dart';

import 'package:bt_app/main.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:bt_app/components/actions/action_card.dart';
import 'package:bt_app/components/shared/currency_slider/currency_slider.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';

class ActionsPage extends HookConsumerWidget {
  const ActionsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final actionsController = ref.watch(actionsProvider);

    return Scaffold(
        body: CustomRefreshIndicator(
            builder: MaterialIndicatorDelegate(
              edgeOffset: 210,
              displacement: 0,
              builder: (context, controller) {
                return const Icon(
                  Icons.ac_unit,
                  color: Colors.blue,
                  size: 30,
                );
              },
            ),
            onRefresh: () async =>
                await ref.read(actionsProvider.notifier).refreshActions(true),
            child: actionsController.when(
                data: (data) => CustomScrollView(
                        controller:
                            PageWrapper.of(context)?.bottomBarController,
                        slivers: [
                          SliverAppBar(
                            expandedHeight: 100,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            surfaceTintColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            flexibleSpace:
                                LayoutBuilder(builder: (context, constraints) {
                              double top = constraints.biggest.height;
                              return FlexibleSpaceBar(
                                  titlePadding: const EdgeInsets.only(
                                      left: 20, bottom: 8, right: 14),
                                  centerTitle: top < 60 ? true : false,
                                  title: top < 60
                                      ? Center(
                                          child: Text(
                                          'Actions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.apply(fontWeightDelta: 4),
                                        ))
                                      : Text(
                                          'Actions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.apply(fontWeightDelta: 4),
                                        ));
                            }),
                            floating: true,
                            snap: false,
                            pinned: true,
                          ),
                          const SliverToBoxAdapter(
                            child: CurrencySlider(),
                          ),
                          SliverPadding(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            sliver: SliverList(
                                delegate: SliverChildListDelegate(
                                    List.generate(data.length, (index) {
                              return ActionCard(
                                  id: data[index].id,
                                  profileName: data[index].author,
                                  profileImage: data[index].urlIcon,
                                  content: data[index].content,
                                  createdAt: data[index].createdAt);
                            }))),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 60),
                          ),
                        ]),
                error: (_, __) => Center(child: Text(__.toString())),
                loading: () => CustomScrollView(
                        controller:
                            PageWrapper.of(context)?.bottomBarController,
                        slivers: [
                          SliverAppBar(
                            expandedHeight: 100,
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            surfaceTintColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            flexibleSpace:
                                LayoutBuilder(builder: (context, constraints) {
                              double top = constraints.biggest.height;
                              return FlexibleSpaceBar(
                                  titlePadding: const EdgeInsets.only(
                                      left: 20, bottom: 8, right: 14),
                                  centerTitle: top < 60 ? true : false,
                                  title: top < 60
                                      ? Center(
                                          child: Text(
                                          'Actions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.apply(fontWeightDelta: 4),
                                        ))
                                      : Text(
                                          'Actions',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.apply(fontWeightDelta: 4),
                                        ));
                            }),
                            floating: true,
                            snap: false,
                            pinned: true,
                          ),
                          const SliverToBoxAdapter(
                            child: CurrencySlider(),
                          ),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 20),
                          ),
                          SliverPadding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              sliver: SliverToBoxAdapter(
                                child: SizedBox(
                                    height: height,
                                    child: ShimmerList(
                                        width: width,
                                        height: 135,
                                        borderRadius: BorderRadius.circular(16),
                                        axis: Axis.vertical,
                                        spacing: 20)),
                              )),
                          const SliverToBoxAdapter(
                            child: SizedBox(height: 60),
                          ),
                        ]))));
  }
}
