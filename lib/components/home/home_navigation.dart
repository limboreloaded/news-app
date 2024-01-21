import 'package:bt_app/controllers/various_controllers.dart';
import 'package:bt_app/data/models.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';

class HomeNavigation extends HookConsumerWidget {
  const HomeNavigation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeCardsController = ref.watch(routeCardsProvider);

    return Container(
        height: 150,
        padding: const EdgeInsets.only(top: 10, left: 0),
        child: routeCardsController.when(
            data: (data) => ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final card = RouteCard(model: data[index]);

                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? 10 : 0,
                        right: index == data.length - 1 ? 10 : 0,
                      ),
                      child: card,
                    );
                  },
                  itemCount: data.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                ),
            error: (_, __) => Center(child: Text(__.toString())),
            loading: () => Padding(
                padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                child: ShimmerList(
                    height: 150,
                    width: 210,
                    axis: Axis.horizontal,
                    spacing: 20,
                    borderRadius: BorderRadius.circular(16)))));
  }
}

class RouteCard extends StatelessWidget {
  final StatsModel model;
  const RouteCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        width: 210,
        padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 58, 55, 55),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(model.icon),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Center(
                          child: Text(
                            model.category,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.apply(fontWeightDelta: 1),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            const SizedBox(height: 8),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey,
              ),
              onPressed: () => context.go(model.route),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.number.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(fontWeightDelta: 3),
                  ),
                  const SizedBox(width: 3),
                  Text(
                    model.text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.apply(fontWeightDelta: 0),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_right_alt,
                    size: 21,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
