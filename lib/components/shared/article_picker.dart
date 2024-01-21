import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:bt_app/data/models.dart';
import 'package:bt_app/components/shared/article_content.dart';
import 'package:flutter/material.dart';
import 'package:bt_app/controllers/chain_item_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class ArticlePicker extends StatefulHookConsumerWidget {
  final String id;
  final ScrollController scrollController;
  final List<ArticlesModel> articles;

  const ArticlePicker(
      {super.key,
      required this.id,
      required this.scrollController,
      required this.articles});

  @override
  ArticlePickerState createState() => ArticlePickerState();
}

class ArticlePickerState extends ConsumerState<ArticlePicker> {
  ArticlePickerState();

  @override
  Widget build(BuildContext context) {
    final chainItemController = ref.watch(chainItemFamily(widget.id));

    return chainItemController.when(
        data: (data) => Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 30),
                child: Text(data.name),
              ),
              ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: widget.scrollController,
                  shrinkWrap: true,
                  children: widget.articles
                      .map((e) => ListTile(
                          onTap: () {
                            showFlexibleBottomSheet(
                                context: context,
                                builder: (context, scrollController,
                                    bottomSheetOffset) {
                                  return ArticleContent(
                                      scrollController: scrollController,
                                      entityId: widget.id,
                                      entityType: "Chain",
                                      content: e.content);
                                });
                          },
                          title: Text(e.title)))
                      .toList())
            ]),
        error: (_, __) => Center(child: Text(__.toString())),
        loading: () => const Center());
  }
}
