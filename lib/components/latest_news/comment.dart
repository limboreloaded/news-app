import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  final String id;
  final String username;
  final String avatarUrl;
  final String content;
  final Function setReplyState;
  final List? replies;

  const Comment(
      {super.key,
      required this.id,
      required this.username,
      required this.avatarUrl,
      required this.content,
      required this.setReplyState,
      required this.replies});

  @override
  CommentState createState() => CommentState();
}

class CommentState extends State<Comment> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(widget.avatarUrl)),
      trailing: widget.replies!.isEmpty
          ? const SizedBox.shrink()
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                  "${widget.replies!.length.toString()} ${widget.replies!.length == 1 ? " reply" : " replies"}")),
      title: Text(widget.username),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(widget.content),
        TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft),
            onPressed: () => widget.setReplyState(),
            child: const Text("Reply"))
      ]),
    );
  }
}
