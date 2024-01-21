import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CurrencyPillNormal extends StatelessWidget {
  final String id;
  final String icon;
  final String price;
  final String symbol;
  final void Function()? onTap;
  final String currentTag;
  final bool isPriceUp;

  const CurrencyPillNormal({
    super.key,
    required this.id,
    required this.icon,
    required this.price,
    required this.symbol,
    this.onTap,
    required this.currentTag,
    required this.isPriceUp,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: onTap,
            child: Ink(
                width: 145,
                height: 30,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: (id == currentTag && onTap != null)
                        ? Colors.blue
                        : Colors.white),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundImage: CachedNetworkImageProvider(icon),
                    backgroundColor: Colors.orange,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      symbol,
                      style: Theme.of(context).textTheme.bodyLarge?.apply(
                            color: (id == currentTag && onTap != null)
                                ? Colors.white
                                : Colors.black,
                            fontWeightDelta: symbol == currentTag ? 3 : 0,
                          ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('\$$price',
                            style: (id == currentTag && onTap != null)
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.apply(color: Colors.white)
                                : Theme.of(context).textTheme.bodyMedium?.apply(
                                    color:
                                        isPriceUp ? Colors.green : Colors.red),
                            overflow: TextOverflow.ellipsis),
                      ])
                ]))));
  }
}

class CurrencyPillShimmer extends StatelessWidget {
  const CurrencyPillShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.blueGrey,
      highlightColor: Colors.grey,
      child: Container(
        width: 140,
        height: 30,
        padding: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
      ),
    );
  }
}
