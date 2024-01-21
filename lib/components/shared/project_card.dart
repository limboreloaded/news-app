import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:bt_app/components/shared/article_content.dart';
import 'package:bt_app/components/shared/article_picker.dart';
import 'package:bt_app/controllers/dapp_controller.dart';
import 'package:bt_app/controllers/nft_controller.dart';
import 'package:bt_app/controllers/chain_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectCard extends ConsumerWidget {
  final String id;
  final String type;
  final String urlLogo;
  final bool large;

  const ProjectCard(
      {super.key,
      required this.id,
      required this.urlLogo,
      required this.large,
      required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dappController = ref.watch(dappProvider.notifier);
    final nftController = ref.watch(nftsProvider.notifier);
    final chainController = ref.watch(chainsProvider.notifier);

    Map typeToController = {
      "Dapp": dappController,
      "Nft": nftController,
      "Chain": chainController
    };

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () => typeToController[type]
                .fetchArticlesForEntity(id)
                .then((result) => showFlexibleBottomSheet(
                      useRootNavigator: true,
                      anchors: [0, 0.5, 1],
                      context: context,
                      builder: (context, controller, offset) {
                        return type != "Chain"
                            ? ArticleContent(
                                scrollController: controller,
                                entityType: type,
                                entityId: id,
                                content: result[0].content)
                            : ArticlePicker(
                                id: id,
                                articles: result,
                                scrollController: controller,
                              );
                      },
                    )),
            child: Ink(
                width: large ? 155 : 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(urlLogo)),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ))));
  }
}
