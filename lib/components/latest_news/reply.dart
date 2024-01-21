import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Reply extends StatelessWidget {
  final String username;
  final String avatarUrl;
  final String content;

  const Reply(
      {super.key,
      required this.username,
      required this.content,
      required this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey,
        child: Container(
            padding:
                const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 16,
                        backgroundImage: CachedNetworkImageProvider(avatarUrl)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      username,
                      style: Theme.of(context).textTheme.titleMedium,
                    )
                  ],
                ),
                const SizedBox(height: 14),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      content,
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
              ],
            )));
  }
}
