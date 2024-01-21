import 'package:bt_app/components/latest_news/comment.dart';
import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

class CommentsSection extends StatefulWidget {
  final int? commentsCount;
  final List? comments;
  final Function setReplyState;

  const CommentsSection(
      {super.key,
      required this.commentsCount,
      required this.comments,
      required this.setReplyState});

  @override
  CommentsSectionState createState() => CommentsSectionState();
}

class CommentsSectionState extends State<CommentsSection>
    with SingleTickerProviderStateMixin {
  List<ExpandableNotifier> listComments(List comments) {
    final filteredComments =
        comments.where((element) => element["repliedTo"] == null);

    List<ExpandableNotifier> commentList = filteredComments.map((comment) {
      final List replies = comments
          .where((searchingComment) =>
              comment["id"] == searchingComment["repliedTo"])
          .toList();

      return ExpandableNotifier(
        initialExpanded: replies.length >= 2,
        child: ExpandablePanel(
            header: Comment(
              id: comment["id"],
              username: comment["username"],
              avatarUrl: comment["avatar_url"],
              content: comment["content"],
              replies: replies,
              setReplyState: () => widget.setReplyState({
                "id": comment["id"],
                "username": comment["username"],
                "avatarUrl": comment["avatar_url"],
                "content": comment["content"]
              }),
            ),
            theme: ExpandableThemeData(
                iconColor: Colors.white,
                useInkWell: false,
                iconPadding: const EdgeInsets.only(top: 24, right: 10),
                tapHeaderToExpand: false,
                hasIcon: replies.isNotEmpty ? true : false,
                collapseIcon: Icons.arrow_upward,
                expandIcon: Icons.arrow_downward),
            collapsed: const Center(),
            expanded: Column(
              children: replies
                  .map((e) => Comment(
                        id: e["id"],
                        username: e["username"],
                        avatarUrl: e["avatar_url"],
                        content: e["content"],
                        replies: const [],
                        setReplyState: () => widget.setReplyState({
                          "id": comment["id"],
                          "username": comment["username"],
                          "avatarUrl": comment["avatar_url"],
                          "content": comment["content"]
                        }),
                      ))
                  .toList(),
            )),
      );
    }).toList();

    return commentList;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.commentsCount == 0 || widget.comments == null) {
      return SliverToBoxAdapter(
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(widget.comments == null
                          ? "Loading..."
                          : "No comments found on this post.")))));
    }

    return SliverPadding(
        padding:
            const EdgeInsets.only(bottom: 110 + kFloatingActionButtonMargin),
        sliver: SliverList(
          delegate: SliverChildListDelegate(listComments(widget.comments!)),
        ));
  }
}
