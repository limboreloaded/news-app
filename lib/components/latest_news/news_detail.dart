import 'dart:convert';
import 'dart:math';

import 'package:bt_app/components/latest_news/comments_section.dart';
import 'package:bt_app/controllers/news_item_controller.dart';
import 'package:bt_app/controllers/user_controller.dart';
import 'package:http/http.dart' as http;
import 'package:bt_app/utils/prefs.dart';
import 'package:bt_app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  final String imageUrl;
  final String urlSource;

  const HeaderDelegate({required this.imageUrl, required this.urlSource});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return InkWell(
        onTap: () => launchUrl(Uri.parse(urlSource)),
        child: Ink(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(imageUrl),
                  fit: BoxFit.cover)),
        ));
  }

  @override
  get maxExtent => 250;

  @override
  get minExtent => 250;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class NewsDetail extends StatefulHookConsumerWidget {
  final String id;
  final ScrollController scrollController;

  const NewsDetail(
      {super.key, required this.id, required this.scrollController});

  @override
  NewsDetailState createState() => NewsDetailState();
}

class NewsDetailState extends ConsumerState<NewsDetail>
    with SingleTickerProviderStateMixin {
  NewsDetailState();

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  dynamic replyState;

  void setReplyState(dynamic replyStateEntry) {
    setState(() {
      replyState = replyStateEntry;
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsItemController = ref.watch(newsItemFamily(widget.id));

    Future<void> updateNewsItem() async {
      final Uri url =
          Uri.parse("${config["SERVER_URL"]!}/comments/${widget.id}");
      final commentsRequest = await http.get(url);
      final commentsResponse = jsonDecode(commentsRequest.body);

      await ref
          .read(newsItemFamily(widget.id).notifier)
          .updateNewsComments(widget.id, {
        "comments": commentsResponse["data"]["comments"],
        "commentsCount": commentsResponse["data"]["comment_count"],
        "discordThread": commentsResponse["data"]["discord_thread"]
      });

      return;
    }

    Future<void> updateNewsIfPossible() async {
      final newsItemState = ref.read(newsItemFamily(widget.id).notifier);
      final comments = ref.read(newsItemFamily(widget.id)).value?.comments;

      if (comments == null) {
        await updateNewsItem();
        return ref.invalidate(newsItemFamily(widget.id));
      }

      bool canUpdate = await newsItemState.canUpdate();

      if (canUpdate) {
        await updateNewsItem();
        return ref.invalidate(newsItemFamily(widget.id));
      }
    }

    //! The useEffect has to pass the hasValue value,
    //! otherwise the useEffect would trigger in the first frame
    //! and therefore the controller.value would be null

    useEffect(() {
      if (newsItemController.hasValue) {
        updateNewsIfPossible();
      }
      return;
    }, [newsItemController.hasValue]);

    Future<void> submitComment(String value, dynamic replyState) async {
      final userController = ref.watch(userProvider);

      final String username = userController.value!.discordName;

      final sharedPrefs = ref.read(sharedPrefsProvider);
      final String? accessToken = sharedPrefs.getAccessToken();

      if (accessToken == null) return;

      final commentThread = newsItemController.value?.discordThread ?? "none";

      final Map<String, dynamic> data = {
        "access_token": accessToken,
        "comment": value,
        "comment_thread": commentThread,
        "replied_to": replyState != null ? replyState["username"] : "none",
        "news_title": newsItemController.value?.title
      };

      String? serverBaseUrl = config["SERVER_URL"];
      Uri serverUrl = Uri.parse("$serverBaseUrl/comments/${widget.id}");

      final discordThreadResponse = await http.post(serverUrl, body: data);
      final Map<String, dynamic> discordThread =
          jsonDecode(discordThreadResponse.body);

      List? comments = newsItemController.value!.comments;

      List? newComments = [...?comments];

      newComments.add({
        "id": generateCommentId(
            newsItemController.value?.commentsCount.toString()),
        "username": username,
        "avatar_url": userController.value?.avatarUrl,
        "content": value,
        "repliedTo": replyState != null ? replyState["id"] : null
      });

      final newsEntryUpdateJson = {
        'comments': jsonEncode(newComments),
        'commentsCount': newsItemController.value!.commentsCount! + 1,
        'discordThread': jsonEncode(discordThread["data"]),
      };

      await ref
          .read(newsItemFamily(widget.id).notifier)
          .updateNewsComments(widget.id, newsEntryUpdateJson);
      ref.invalidate(newsItemFamily(widget.id));
    }

    final userController = ref.watch(userProvider);

    return newsItemController.when(
        data: (data) => Stack(children: [
              CustomScrollView(
                clipBehavior: Clip.none,
                physics: const NeverScrollableScrollPhysics(),
                controller: widget.scrollController,
                slivers: [
                  SliverPersistentHeader(
                      delegate: HeaderDelegate(
                          imageUrl: data.urlImage, urlSource: data.urlSource)),
                  SliverPadding(
                    padding: const EdgeInsets.all(24),
                    sliver: SliverToBoxAdapter(
                        child: TextButton(
                      onPressed: () => launchUrl(Uri.parse(data.urlSource)),
                      child: Text(data.title,
                          style: Theme.of(context).textTheme.headlineLarge),
                    )),
                  ),
                  CommentsSection(
                    comments: data.comments,
                    commentsCount: data.commentsCount,
                    setReplyState: (dynamic replyStateEntry) =>
                        setReplyState(replyStateEntry),
                  )
                ],
              ),
              Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: const Color.fromARGB(255, 35, 33, 33),
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            ref.read(userProvider.notifier).isAuthenticated()
                                ? CachedNetworkImageProvider(
                                    userController.value!.avatarUrl)
                                : null,
                        backgroundColor: const Color.fromARGB(255, 39, 7, 153),
                        radius: 25,
                      ),
                      title: TextField(
                        enabled:
                            ref.read(userProvider.notifier).isAuthenticated(),
                        controller: textEditingController,
                        focusNode: focusNode,
                        onSubmitted: (value) {
                          submitComment(value, replyState);
                          textEditingController.text = "";
                          if (replyState != null) {
                            setReplyState(null);
                          }
                        },
                      ),
                    ),
                  )),
              Positioned(
                bottom: 110,
                child: AnimatedContainer(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    duration: const Duration(milliseconds: 200),
                    height: replyState != null ? 50 : 0,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        replyState != null
                            ? Text("Replying to {username}".replaceAll(
                                "{username}", replyState["username"]))
                            : const Center(),
                        if (replyState != null)
                          IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => setReplyState(null))
                      ],
                    )),
              ),
            ]),
        error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

String generateCommentId(String? commentIndex) {
  final random = Random();
  const allChars =
      'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL234567890';
  final randomString =
      List.generate(6, (index) => allChars[random.nextInt(allChars.length)])
          .join();
  return "$commentIndex$randomString";
}
