import 'package:bt_app/data/models.dart';
import 'package:bt_app/controllers/various_controllers.dart';
import 'package:flutter/material.dart';
import 'package:bt_app/components/shared/marquee.dart';
import 'package:bt_app/components/shared/currency_slider/currency_pill.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:bt_app/controllers/prices_controller.dart';
import 'package:bt_app/components/shared/shimmer_list.dart';

List<Widget> shimmerList = [
  const SizedBox(width: 20),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
  const SizedBox(width: 10),
  const CurrencyPillShimmer(),
];

class CurrencySlider extends HookConsumerWidget {
  final Function? onTap;

  const CurrencySlider({super.key, this.onTap, required});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pricesController = ref.watch(pricesProvider);

    return pricesController.when(
        skipLoadingOnRefresh: false,
        loading: () => const CurrencySliderLoading(),
        error: (error, stackTrace) => const CurrencySliderError(),
        data: (data) => CurrencySliderView(
              data: data,
              onTap: onTap,
            ));
  }
}

class CurrencySliderView extends ConsumerWidget {
  final Function? onTap;
  final List<CurrencyPillModel> data;

  const CurrencySliderView(
      {super.key, required this.onTap, required this.data});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);

    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: Marquee(
          duration: const Duration(minutes: 15),
          gap: 0,
          scrollDirection: Axis.horizontal,
          child: Row(children: generateItems(data, onTap, filter.toString())),
        ));
  }
}

class CurrencySliderLoading extends ConsumerWidget {
  const CurrencySliderLoading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.of(context).size.width;

    return Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12),
        child: SizedBox(
            height: 30,
            width: width,
            child: ShimmerList(
                width: 145,
                height: 35,
                borderRadius: BorderRadius.circular(16),
                axis: Axis.horizontal,
                spacing: 10)));
  }
}

class CurrencySliderError extends ConsumerWidget {
  const CurrencySliderError({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Text("Oops! Looks like you have encountered an error.");
  }
}

List<Widget> generateItems(List<CurrencyPillModel> generatedModelList,
    Function? onTap, String currentTag) {
  return generatedModelList
      .map((e) => Row(children: [
            CurrencyPillNormal(
              id: e.id,
              icon: e.icon,
              price: e.price,
              symbol: e.symbol,
              onTap: onTap != null ? () => onTap(e.id) : null,
              currentTag: currentTag,
              isPriceUp: e.isPriceUp,
            ),
            const SizedBox(width: 10)
          ]))
      .toList();
}
